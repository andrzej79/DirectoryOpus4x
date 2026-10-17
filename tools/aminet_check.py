#!/usr/bin/env python3
"""Check an Aminet upload (archive + readme) against the Aminet rules.

  aminet_check.py <archive> <readme>

See https://wiki.aminet.net/Uploading_instructions and
https://wiki.aminet.net/The_Readme_file:
- file names at most 30 characters, letters, digits, '.', '_', '-';
- the readme has the archive's base name, same case;
- readme lines at most 78 characters, LF line ends (no CR);
- header fields first, Short: on the first line, at most 40 characters;
  Uploader:, Type: and Architecture: present; a blank line after them.
Also checks that the readme is plain ASCII and that no @...@ placeholder
is left.  Exits 1 on any error.
"""
import os
import re
import sys

NAME_RE = re.compile(r'^[A-Za-z0-9._-]{1,30}$')
REQUIRED = ('Short', 'Uploader', 'Type', 'Architecture')
ARCHS = ('m68k-amigaos', 'ppc-amigaos', 'ppc-morphos', 'ppc-powerup', 'ppc-warpup',
         'i386-aros', 'i386-amithlon', 'generic')


def check(archive, readme):
    errors = []
    for path in (archive, readme):
        name = os.path.basename(path)
        if not NAME_RE.match(name):
            errors.append('%s: name must be 1-30 characters of A-Z a-z 0-9 . _ -' % name)
    if os.path.splitext(os.path.basename(archive))[0] != os.path.splitext(os.path.basename(readme))[0]:
        errors.append('%s and %s: base names differ' % (archive, readme))
    if os.path.splitext(readme)[1] != '.readme':
        errors.append('%s: must end in .readme' % readme)

    data = open(readme, 'rb').read()
    if b'\r' in data:
        errors.append('%s: has CR characters, use LF line ends only' % readme)
    try:
        text = data.decode('ascii')
    except UnicodeDecodeError as e:
        errors.append('%s: not plain ASCII (byte %d)' % (readme, e.start))
        text = data.decode('latin-1')
    lines = text.split('\n')
    for n, line in enumerate(lines, 1):
        if len(line) > 78:
            errors.append('%s:%d: %d characters, at most 78' % (readme, n, len(line)))
        if re.search(r'@[A-Z_]+@', line):
            errors.append('%s:%d: placeholder left: %s' % (readme, n, line.strip()))

    fields = {}
    for line in lines:
        if not line.strip():
            break
        m = re.match(r'^([A-Za-z]+):\s*(.*)$', line)
        if not m:
            errors.append('%s: header line is not "Field: value": %s' % (readme, line))
            continue
        fields[m.group(1)] = m.group(2)
    if not lines[0].startswith('Short:'):
        errors.append('%s: the first line must be Short:' % readme)
    for f in REQUIRED:
        if not fields.get(f):
            errors.append('%s: %s: missing' % (readme, f))
    if len(fields.get('Short', '')) > 40:
        errors.append('%s: Short: is %d characters, at most 40' % (readme, len(fields['Short'])))
    for arch in fields.get('Architecture', '').split(';'):
        if arch.strip() and arch.split()[0] not in ARCHS:
            errors.append('%s: Architecture: unknown %s' % (readme, arch.split()[0]))
    if fields.get('Distribution') not in (None, 'NoCD', 'Aminet'):
        errors.append('%s: Distribution: must be NoCD or Aminet' % readme)
    return errors


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    errors = check(sys.argv[1], sys.argv[2])
    for e in errors:
        print('aminet_check: ' + e, file=sys.stderr)
    if errors:
        sys.exit(1)
    print('aminet_check: %s and %s OK' % (sys.argv[1], sys.argv[2]))


if __name__ == '__main__':
    main()
