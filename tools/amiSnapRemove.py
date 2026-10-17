#!/usr/bin/env python3
"""
amiga_icon_unsnap.py  —  Remove snapshot position from Amiga OS 3.x icon files.

When do_CurrentX / do_CurrentY are set to NO_ICON_POSITION (0x80000000),
Workbench auto-positions the icon instead of locking it to fixed coordinates.

Usage:
    python3 amiga_icon_unsnap.py <file.info> [file2.info ...]
    python3 amiga_icon_unsnap.py *.info --no-backup
    python3 amiga_icon_unsnap.py <file.info> --dry-run
"""

import struct
import sys
import os
import shutil
import glob

# ---------------------------------------------------------------------------
# Amiga Workbench constants
# ---------------------------------------------------------------------------

WB_MAGIC         = 0xE310      # First UWORD of every valid .info file
NO_ICON_POSITION = 0x80000000  # Tells Workbench to auto-position the icon

# ---------------------------------------------------------------------------
# DiskObject binary layout (big-endian, Motorola 68000)
#
#  +0   UWORD  do_Magic          <-- 0xE310
#  +2   UWORD  do_Version
#  +4   struct Gadget (44 bytes)
#         +4   APTR   NextGadget
#         +8   WORD   LeftEdge
#         +10  WORD   TopEdge
#         +12  WORD   Width
#         +14  WORD   Height
#         +16  UWORD  Flags
#         +18  UWORD  Activation
#         +20  UWORD  GadgetType
#         +22  APTR   GadgetRender
#         +26  APTR   SelectRender
#         +30  APTR   GadgetText
#         +34  LONG   MutualExclude
#         +38  APTR   SpecialInfo
#         +42  UWORD  GadgetID
#         +44  APTR   UserData
#  +48  UBYTE  do_Type
#  +49  (1 byte alignment padding)
#  +50  APTR   do_DefaultTool
#  +54  APTR   do_ToolTypes
#  +58  LONG   do_CurrentX   <-- snapshot X position  (PATCHED HERE)
#  +62  LONG   do_CurrentY   <-- snapshot Y position  (PATCHED HERE)
#  +66  APTR   do_DrawerData
#  +70  APTR   do_ToolWindow
#  +74  LONG   do_StackSize
# ---------------------------------------------------------------------------

OFFSET_MAGIC        = 0
OFFSET_VERSION      = 2
OFFSET_CURRENT_X    = 58
OFFSET_CURRENT_Y    = 62
DISKOBJECT_MIN_SIZE = 78   # minimum valid file size

ICON_TYPES = {
    1: "WBDISK",
    2: "WBDRAWER",
    3: "WBTOOL",
    4: "WBPROJECT",
    5: "WBGARBAGE",
    6: "WBDEVICE",
    7: "WBKICK",
    8: "WBAPPICON",
}

# ---------------------------------------------------------------------------
# Low-level helpers
# ---------------------------------------------------------------------------

def read_file(path):
    with open(path, "rb") as f:
        return bytearray(f.read())

def write_file(path, data):
    with open(path, "wb") as f:
        f.write(data)

def validate(data):
    """Raise ValueError when data is not a valid Amiga icon."""
    if len(data) < DISKOBJECT_MIN_SIZE:
        raise ValueError(
            "File is only {} bytes — too small for a valid .info file "
            "(minimum {} bytes).".format(len(data), DISKOBJECT_MIN_SIZE)
        )
    magic = struct.unpack_from(">H", data, OFFSET_MAGIC)[0]
    if magic != WB_MAGIC:
        raise ValueError(
            "Bad magic: 0x{:04X} (expected 0x{:04X}). "
            "Not an Amiga Workbench icon.".format(magic, WB_MAGIC)
        )

def get_position(data):
    """Return (do_CurrentX, do_CurrentY) as unsigned 32-bit integers."""
    x = struct.unpack_from(">I", data, OFFSET_CURRENT_X)[0]
    y = struct.unpack_from(">I", data, OFFSET_CURRENT_Y)[0]
    return x, y

def get_icon_type(data):
    t = data[48]
    return ICON_TYPES.get(t, "UNKNOWN(0x{:02X})".format(t))

def is_snapped(data):
    """Return True when the icon has a fixed snapshot position."""
    x, y = get_position(data)
    return not (x == NO_ICON_POSITION and y == NO_ICON_POSITION)

def remove_snapshot(data):
    """Set do_CurrentX and do_CurrentY to NO_ICON_POSITION in-place."""
    struct.pack_into(">I", data, OFFSET_CURRENT_X, NO_ICON_POSITION)
    struct.pack_into(">I", data, OFFSET_CURRENT_Y, NO_ICON_POSITION)

def format_pos(value):
    if value == NO_ICON_POSITION:
        return "0x80000000  (NO_ICON_POSITION — auto)"
    signed = struct.unpack(">i", struct.pack(">I", value))[0]
    return "{}  (0x{:08X})".format(signed, value)

# ---------------------------------------------------------------------------
# Per-file processing
# ---------------------------------------------------------------------------

def process_icon(path, backup=True, dry_run=False):
    """
    Remove the snapshot position from one .info file.
    Returns True if modified (or would be), False if already auto-positioned.
    """
    data = read_file(path)
    validate(data)

    version   = struct.unpack_from(">H", data, OFFSET_VERSION)[0]
    icon_type = get_icon_type(data)
    x, y      = get_position(data)

    print("  Type    : {}".format(icon_type))
    print("  Version : {}".format(version))
    print("  X       : {}".format(format_pos(x)))
    print("  Y       : {}".format(format_pos(y)))

    if not is_snapped(data):
        print("  Already auto-positioned — no changes needed.")
        return False

    if dry_run:
        print("  [dry-run] Would set X and Y to NO_ICON_POSITION (0x80000000).")
        return True

    if backup:
        bak = path + ".bak"
        shutil.copy2(path, bak)
        print("  Backup  : {}".format(bak))

    remove_snapshot(data)
    write_file(path, data)
    print("  Snapshot removed — icon will be auto-positioned by Workbench.")
    return True

# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

HELP = """\
amiga_icon_unsnap.py  —  Remove snapshot position from Amiga OS 3.x .info files.

Usage:
  python3 amiga_icon_unsnap.py [OPTIONS] <file.info> [file2.info ...]

Options:
  --no-backup   Skip creating .bak files before modifying icons.
  --dry-run     Preview changes without writing anything to disk.
  --help        Show this help and exit.

How it works:
  The Amiga Workbench stores an icon's last snapshotted position in the fields
  do_CurrentX and do_CurrentY inside the DiskObject struct (byte offsets 58
  and 62 of the .info file, big-endian LONGs).

  Setting both to 0x80000000 (NO_ICON_POSITION) tells Workbench to auto-place
  the icon, identical to a freshly created, never-snapshotted icon.
  The rest of the file is left completely untouched.
"""

def parse_args(argv):
    flags = {"--no-backup": False, "--dry-run": False, "--help": False}
    paths = []
    for arg in argv[1:]:
        if arg in flags:
            flags[arg] = True
        elif arg.startswith("-"):
            print("Unknown option: {}".format(arg), file=sys.stderr)
            sys.exit(1)
        else:
            expanded = glob.glob(arg)
            paths.extend(expanded if expanded else [arg])
    return paths, flags

def main():
    paths, flags = parse_args(sys.argv)

    if flags["--help"] or not paths:
        print(HELP)
        sys.exit(0)

    backup  = not flags["--no-backup"]
    dry_run = flags["--dry-run"]

    if dry_run:
        print("*** DRY RUN — no files will be modified ***\n")

    ok = err = skipped = 0

    for path in paths:
        print("\n" + "-" * 60)
        print("File: {}".format(path))
        if not os.path.isfile(path):
            print("  ERROR: file not found.", file=sys.stderr)
            err += 1
            continue
        try:
            changed = process_icon(path, backup=backup, dry_run=dry_run)
            if changed:
                ok += 1
            else:
                skipped += 1
        except (OSError, ValueError) as exc:
            print("  ERROR: {}".format(exc), file=sys.stderr)
            err += 1

    total = ok + err + skipped
    print("\n" + "=" * 60)
    print("Processed {} file(s): {} modified, {} already auto, {} error(s).".format(
        total, ok, skipped, err))
    if err:
        sys.exit(1)

if __name__ == "__main__":
    main()
