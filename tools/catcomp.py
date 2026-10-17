#!/usr/bin/env python3
"""Compile locale.library catalogs from catalog descriptions (.cd) and
translations (.ct), and check the descriptions against the sources.

  catcomp.py compile <name.cd> <lang/name.ct> <out.catalog>
  catcomp.py build <catalogs dir> <out dir>
  catcomp.py check <name.cd> <strings.h> <strings.c>

compile writes an IFF CTLG catalog (FORM CTLG with FVER, LANG, CSET and
STRS chunks), as FlexCat or CatComp would.  The string IDs come from the .cd:
"NAME (id/min/max)", where an empty id is the previous one plus 1 (starting
at 0) and "+n" adds n to it.  A .ct gives "## version", "## language" and,
for each translated string, its NAME line followed by the text; strings it
leaves out, leaves empty or leaves in English (with or without the "_"
of a keyboard shortcut) are not written, so the program shows its
built-in English for them.  Text lines ending in a backslash continue on
the next line.  Escapes: \\n \\t \\e \\a \\b \\f \\r \\v \\\\ \\" \\ooo \\xhh.
.cd and .ct files are ISO-8859-1, which is what the Amiga uses.

build compiles every <catalogs dir>/<lang>/<name>.ct (the name in any case)
with <catalogs dir>/<name>.cd into <out dir>/<lang>/<name>.catalog, the
names spelled as in the .cd.

check fails unless the .cd lists exactly the names of the enum in
strings.h (the one that ends in STR_STRING_COUNT) with the same values,
and every English text in the .cd matches default_strings[] in strings.c.
The program asks for strings by their enum value, so a .cd out of step
with it would give wrong translations.
"""
import os
import re
import struct
import sys

ESCAPES = {'n': '\n', 't': '\t', 'e': '\033', 'a': '\a', 'b': '\b', 'f': '\f', 'r': '\r', 'v': '\v',
           '\\': '\\', '"': '"', "'": "'", '?': '?'}


def unescape(s, where):
    out, i = [], 0
    while i < len(s):
        c = s[i]
        if c != '\\':
            out.append(c)
            i += 1
            continue
        i += 1
        if i >= len(s):
            sys.exit('%s: backslash at the end of a string' % where)
        c = s[i]
        if c in ESCAPES:
            out.append(ESCAPES[c])
            i += 1
        elif c in '01234567':
            m = re.match(r'[0-7]{1,3}', s[i:])
            out.append(chr(int(m.group(0), 8)))
            i += len(m.group(0))
        elif c == 'x':
            m = re.match(r'[0-9a-fA-F]{1,2}', s[i + 1:])
            if not m:
                sys.exit('%s: bad \\x escape' % where)
            out.append(chr(int(m.group(0), 16)))
            i += 1 + len(m.group(0))
        else:
            out.append(c)   # unknown escape: the character itself, as FlexCat does
            i += 1
    return ''.join(out)


def read_lines(path):
    return open(path, encoding='latin-1').read().splitlines()


def text_lines(lines, i):
    """The text starting at lines[i], joined over continuation lines, and the next index."""
    text = ''
    while i < len(lines) and lines[i].endswith('\\') and not lines[i].endswith('\\\\'):
        text += lines[i][:-1]
        i += 1
    if i < len(lines):
        text += lines[i]
        i += 1
    return text, i


def parse_cd(path):
    """[(name, id, english)] in file order."""
    lines, out, nextid, i = read_lines(path), [], 0, 0
    while i < len(lines):
        line = lines[i]
        i += 1
        if not line or line.startswith(';') or line.startswith('#'):
            continue
        m = re.match(r'^([A-Za-z_]\w*)\s*\(\s*([+]?\d*)\s*/', line)
        if not m:
            sys.exit('%s:%d: expected "NAME (id/min/max)"' % (path, i))
        if m.group(2).startswith('+'):
            nextid += int(m.group(2)[1:])
        elif m.group(2):
            nextid = int(m.group(2))
        text, i = text_lines(lines, i)
        out.append((m.group(1), nextid, unescape(text, '%s:%d' % (path, i))))
        nextid += 1
    return out


def parse_ct(path, names):
    """(directives, {name: translation}); only names from the .cd start an entry."""
    lines, info, strings, i = read_lines(path), {}, {}, 0
    while i < len(lines):
        line = lines[i]
        i += 1
        if line.startswith('##'):
            m = re.match(r'^##\s*(\w+)\s*(.*?)\s*$', line)
            if m:
                info[m.group(1).lower()] = m.group(2)
            continue
        if line.startswith(';') or line.strip() not in names:
            if re.match(r'^[A-Z][A-Z0-9]*_\w*\W*$', line) and line.strip() not in names:
                print('%s:%d: warning: %s is not in the .cd' % (path, i, line.strip()), file=sys.stderr)
            continue
        name = line.strip()
        text, i = text_lines(lines, i)
        if text.startswith(';'):    # no translation, only the commented original
            continue
        if name in strings:
            sys.exit('%s:%d: %s translated twice' % (path, i, name))
        strings[name] = unescape(text, '%s:%d' % (path, i))
    return info, strings


def formats(s):
    """The printf conversions of s, without flags and widths: a translation must keep them."""
    return [re.sub(r'^%[-+ #0]*(\d+|\*)?(\.(\d+|\*))?', '%', f) for f in
            re.findall(r'%[-+ #0]*(?:\d+|\*)?(?:\.(?:\d+|\*))?[hlL]*[a-zA-Z%]', s)]


def chunk(cid, data):
    data = bytes(data)
    pad = b'\0' if len(data) & 1 else b''
    return cid + struct.pack('>L', len(data)) + data + pad


def compile_catalog(cd_path, ct_path, out_path):
    cd = parse_cd(cd_path)
    info, strings = parse_ct(ct_path, {n for n, _, _ in cd})
    catname = os.path.splitext(os.path.basename(cd_path))[0] + '.catalog'
    lang = info.get('language') or os.path.basename(os.path.dirname(ct_path))
    version = info.get('version', '')
    m = re.search(r'\$VER:\s*\S+\s+(.*)$', version)
    fver = '$VER: %s %s' % (catname, m.group(1)) if m else '$VER: %s 1.0' % catname

    strs = b''
    for name, sid, english in cd:
        if strings.get(name) and strings[name] != english and strings[name] != english.replace('_', ''):
            # Leaving out trailing arguments is harmless, using others is not.  An English
            # text without any is no format string ("% free"), so its translation is not checked.
            tf, ef = formats(strings[name]), formats(english)
            if ef and tf != ef[:len(tf)]:
                print('%s: warning: %s has %s, the English %s' % (ct_path, name, ' '.join(tf), ' '.join(ef)),
                      file=sys.stderr)
            data = strings[name].encode('latin-1') + b'\0'
            data += b'\0' * (-len(data) % 4)
            strs += struct.pack('>LL', sid, len(strings[name]) + 1) + data
    cset = struct.pack('>L', int(info.get('codeset', '0') or 0)) + b'\0' * 28
    body = b'CTLG' + chunk(b'FVER', fver.encode('latin-1') + b'\0') + \
        chunk(b'LANG', lang.encode('latin-1') + b'\0') + chunk(b'CSET', cset) + chunk(b'STRS', strs)
    os.makedirs(os.path.dirname(out_path) or '.', exist_ok=True)
    with open(out_path, 'wb') as fh:
        fh.write(b'FORM' + struct.pack('>L', len(body)) + body)


def build(src_dir, out_dir):
    cds = {f[:-3].lower(): f[:-3] for f in os.listdir(src_dir) if f.endswith('.cd')}
    for lang in sorted(os.listdir(src_dir)):
        lang_dir = os.path.join(src_dir, lang)
        if not os.path.isdir(lang_dir):
            continue
        for f in sorted(os.listdir(lang_dir)):
            if not f.endswith('.ct'):
                continue
            name = cds.get(f[:-3].lower())
            if not name:
                sys.exit('%s: no %s.cd for it' % (os.path.join(lang_dir, f), f[:-3]))
            compile_catalog(os.path.join(src_dir, name + '.cd'), os.path.join(lang_dir, f),
                            os.path.join(out_dir, lang, name + '.catalog'))


def strip_c_comments(s):
    return re.sub(r'//[^\n]*|/\*.*?\*/|"(?:\\.|[^"\\])*"',
                  lambda m: m.group(0) if m.group(0).startswith('"') else ' ', s, flags=re.S)


def parse_enum(path):
    s = strip_c_comments(open(path, encoding='latin-1').read())
    for body in re.findall(r'enum\s*\{(.*?)\}', s, re.S):
        if 'STR_STRING_COUNT' not in body:
            continue
        out, val = {}, 0
        for item in (x.strip() for x in body.split(',')):
            if not item:
                continue
            if '=' in item:
                item, v = (x.strip() for x in item.split('=', 1))
                val = int(v, 0)
            out[item] = val
            val += 1
        del out['STR_STRING_COUNT']
        return out
    sys.exit('%s: no enum ending in STR_STRING_COUNT' % path)


def parse_defaults(path):
    s = strip_c_comments(open(path, encoding='latin-1').read())
    m = re.search(r'default_strings\[\]\s*=\s*\{(.*?)\};', s, re.S)
    if not m:
        sys.exit('%s: no default_strings[]' % path)
    out = {}
    for name, lits in re.findall(r'\{\s*(\w+)\s*,\s*((?:"(?:\\.|[^"\\])*"\s*)+)\}', m.group(1)):
        out[name] = unescape(''.join(re.findall(r'"((?:\\.|[^"\\])*)"', lits)), path + ': ' + name)
    return out


def check(cd_path, enum_path, defaults_path):
    cd, enum, defaults = parse_cd(cd_path), parse_enum(enum_path), parse_defaults(defaults_path)
    errors = []
    for name, sid, text in cd:
        if name not in enum:
            errors.append('%s is not in the enum of %s' % (name, enum_path))
        elif enum[name] != sid:
            errors.append('%s has id %d in the .cd but %d in the enum' % (name, sid, enum[name]))
        elif name in defaults and defaults[name] != text:
            errors.append('%s: .cd text %r differs from strings.c %r' % (name, text, defaults[name]))
    names = {n for n, _, _ in cd}
    errors += ['%s is missing from the .cd' % n for n in enum if n not in names]
    for e in errors:
        print('%s: %s' % (cd_path, e), file=sys.stderr)
    return not errors


def main():
    a = sys.argv[1:]
    if len(a) == 4 and a[0] == 'compile':
        compile_catalog(*a[1:])
    elif len(a) == 3 and a[0] == 'build':
        build(*a[1:])
    elif len(a) == 4 and a[0] == 'check':
        if not check(*a[1:]):
            sys.exit(1)
    else:
        sys.exit(__doc__)


if __name__ == '__main__':
    main()
