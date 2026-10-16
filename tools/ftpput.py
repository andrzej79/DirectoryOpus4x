#!/usr/bin/env python3
"""Upload files or a directory tree to an Amiga over FTP, in binary mode.

  ftpput.py <local file or dir> [...] -d <amiga dir>

  ftpput.py build/DirectoryOpus4x -d Work:DirOpus4x/

A directory is uploaded with its contents (not the directory itself) into
<amiga dir>; subdirectories are created as needed, and <amiga dir> too if it
does not exist yet.  Each upload is checked against the server's SIZE where
the server reports one.

The FTP login comes from ftp.local in the project root (git-ignored, see
ftp.local.example); AMIGA_FTP_* environment variables override it:

  AMIGA_FTP_HOST, AMIGA_FTP_USER, AMIGA_FTP_PASSWORD,
  AMIGA_FTP_PORT (21), AMIGA_FTP_PASSIVE (no)
"""
import ftplib
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CONFIG = os.path.join(ROOT, 'ftp.local')


def load_config():
    cfg = {}
    if os.path.exists(CONFIG):
        for line in open(CONFIG):
            m = re.match(r'\s*(?:export\s+)?(AMIGA_FTP_\w+)\s*=\s*(.*?)\s*$', line)
            if m:
                cfg[m.group(1)] = m.group(2).strip('"\'')
    for k, v in os.environ.items():
        if k.startswith('AMIGA_FTP_'):
            cfg[k] = v
    missing = [k for k in ('AMIGA_FTP_HOST', 'AMIGA_FTP_USER', 'AMIGA_FTP_PASSWORD') if not cfg.get(k)]
    if missing:
        sys.exit('ftpput: set %s (environment or %s)' % (', '.join(missing), CONFIG))
    return cfg


def connect(cfg):
    ftp = ftplib.FTP()
    ftp.set_pasv(cfg.get('AMIGA_FTP_PASSIVE', 'no').lower() in ('1', 'yes', 'true', 'on'))
    ftp.connect(cfg['AMIGA_FTP_HOST'], int(cfg.get('AMIGA_FTP_PORT', '21')), timeout=30)
    ftp.login(cfg['AMIGA_FTP_USER'], cfg['AMIGA_FTP_PASSWORD'])
    ftp.voidcmd('TYPE I')     # binary: ASCII mode would rewrite line ends
    return ftp


def amiga_join(d, name):
    return d + name if d.endswith(':') or d.endswith('/') else d + '/' + name


def enter_dir(ftp, path):
    """cwd into an absolute Amiga path, creating it if it is missing."""
    try:
        ftp.cwd(path)
    except ftplib.error_perm:
        ftp.mkd(path)
        ftp.cwd(path)
        print('created %s' % path)


def put_file(ftp, local, remote_dir):
    name = os.path.basename(local)
    with open(local, 'rb') as fh:
        ftp.storbinary('STOR %s' % name, fh)
    size = os.path.getsize(local)
    try:
        remote = ftp.size(name)
    except ftplib.all_errors:
        remote = None
    if remote is not None and remote != size:
        print('%s -> %s: SIZE MISMATCH (%d bytes sent, server says %d)'
              % (local, amiga_join(remote_dir, name), size, remote))
        return False
    print('%s -> %s, %d bytes' % (local, amiga_join(remote_dir, name), size))
    return True


def put_tree(ftp, local_dir, remote_dir):
    ok = True
    entries = sorted(os.listdir(local_dir))
    for name in entries:
        path = os.path.join(local_dir, name)
        if name.startswith('.') or not os.path.isfile(path):
            continue
        ok &= put_file(ftp, path, remote_dir)
    for name in entries:
        path = os.path.join(local_dir, name)
        if name.startswith('.') or not os.path.isdir(path):
            continue
        sub = amiga_join(remote_dir, name)
        enter_dir(ftp, sub)
        ok &= put_tree(ftp, path, sub)
        ftp.cwd(remote_dir)
    return ok


def main():
    args = sys.argv[1:]
    if '-d' not in args:
        sys.exit(__doc__)
    i = args.index('-d')
    remote_dir = args[i + 1]
    if remote_dir.endswith('/') and not remote_dir.endswith(':/'):
        remote_dir = remote_dir.rstrip('/')   # "Work:DirOpus4x/" -> "Work:DirOpus4x"
    del args[i:i + 2]
    if not args:
        sys.exit(__doc__)
    ftp = connect(load_config())
    ok = True
    try:
        enter_dir(ftp, remote_dir)
        for local in args:
            if os.path.isdir(local):
                ok &= put_tree(ftp, local, remote_dir)
            else:
                ok &= put_file(ftp, local, remote_dir)
    finally:
        try:
            ftp.quit()
        except ftplib.all_errors:
            ftp.close()
    sys.exit(0 if ok else 1)


if __name__ == '__main__':
    main()
