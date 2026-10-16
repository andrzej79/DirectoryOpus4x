#!/bin/sh
# Fetch the third-party developer files DOpus needs from Aminet into sdk/.
#
# sdk/ is git-ignored: these files are freely distributable, but most of them
# are "All Rights Reserved" and so do not go into this GPL repository.  Each
# archive is checked against its SHA-256 below, then only the headers (and
# the AsyncIO link-library sources) are unpacked.  vbcc inline headers are
# generated with tools/fd2vbcc.py for the libraries whose dev kits lack them.
#
# Needs: curl, lha (or lhasa), python3, shasum.  Safe to re-run.

set -e

ROOT=$(cd "$(dirname "$0")/.." && pwd)
SDK="$ROOT/sdk"
DL="$SDK/download"
INC="$SDK/include"
TMP="$SDK/tmp"
FD2VBCC="python3 $ROOT/tools/fd2vbcc.py"
AMINET=${AMINET:-https://aminet.net}

# path on Aminet                SHA-256
ARCHIVES="
dev/c/AsyncIO.lha               91eaa0b51b8efc1d0cb35b10aeecd2ba22d773948c89ceb9fbce17b802421d07
util/arc/xadmasterdev.lha       b82c222d712bd2b62b4774d5557684e628968122f897a08332feb743f7a95478
util/pack/xfdmaster_dev.lha     0edea300a9d3cec6367dcb0d2db47e4756e23e88e67046d0e680ab8486dcf554
util/libs/pplib16.lha           540e1887cc1d556edd50eb616641118024c806f546325f608621e2c0a3fa03a9
util/libs/ScreenNotify10.lha    7128e0defe25522043c29469cfaf2b8df4e2e31babda82db494f45ce4d80d3f9
dev/gui/pmdev.lha               f893130d65b57e8a8b47e0e1fe08c246d116747703392b0f26f4dfa03d1e71e8
driver/input/NewMouse12.lha     4e557229dbabfac7634e0eaa45522068ff7ef24b4252874968cd7a43fd68fea6
dev/misc/CGraphX-DevKit.lha     dd2610649a692863dc27bbce595520b0ee269a03e03f73a8858396127df0fb0c
"

if command -v lha >/dev/null 2>&1; then LHA="lha xqf"; else LHA="lhasa xq"; fi

mkdir -p "$DL" "$INC"
rm -rf "$TMP" "$SDK/stubs"
mkdir -p "$TMP"

echo "$ARCHIVES" | while read -r path sum; do
    [ -z "$path" ] && continue
    file="$DL/$(basename "$path")"
    if [ ! -f "$file" ]; then
        echo "Downloading $AMINET/$path"
        curl -sfL -o "$file.part" "$AMINET/$path"
        mv "$file.part" "$file"
    fi
    have=$(shasum -a 256 "$file" | cut -d' ' -f1)
    if [ "$have" != "$sum" ]; then
        echo "SHA-256 mismatch for $file:"
        echo "  expected $sum"
        echo "  got      $have"
        exit 1
    fi
    name=$(basename "$path" .lha)
    mkdir -p "$TMP/$name"
    (cd "$TMP/$name" && $LHA "$file" >/dev/null)
done

# copy <from-dir>/<subdirs...> into sdk/include
put() {
    from=$1; shift
    for f in "$@"; do
        mkdir -p "$INC/$(dirname "$f")"
        cp "$from/$f" "$INC/$f"
    done
}

# xadmaster.library, xfdmaster.library: complete headers incl. vbcc inlines
X=$TMP/xadmasterdev/xad/Include/C
put "$X" libraries/xadmaster.h clib/xadmaster_protos.h proto/xadmaster.h inline/xadmaster_protos.h
X=$TMP/xfdmaster_dev/xfd_Developer/Include/C
put "$X" libraries/xfdmaster.h clib/xfdmaster_protos.h proto/xfdmaster.h inline/xfdmaster_protos.h

# powerpacker.library
X=$TMP/pplib16/PPLib
put "$X/include" libraries/ppbase.h clib/powerpacker_protos.h
$FD2VBCC "$X/fd/powerpacker_lib.fd" "$X/include/clib/powerpacker_protos.h" \
    "$INC/inline/powerpacker_protos.h" --proto "$INC/proto/powerpacker.h" \
    --base-type "struct PPBase"

# screennotify.library
X=$TMP/ScreenNotify10/ScreenNotify
put "$X/include" libraries/screennotify.h clib/screennotify_protos.h
$FD2VBCC "$X/fd/screennotify_lib.fd" "$X/include/clib/screennotify_protos.h" \
    "$INC/inline/screennotify_protos.h" --proto "$INC/proto/screennotify.h"

# popupmenu.library
X=$TMP/pmdev/PopupMenuDeveloper
put "$X/C/include" libraries/pm.h clib/pm_protos.h
$FD2VBCC "$X/popupmenu.fd" "$X/C/include/clib/pm_protos.h" \
    "$INC/inline/pm_protos.h" --proto "$INC/proto/pm.h" \
    --base-type "struct PopupMenuBase" --stubs "$SDK/stubs/pm_stubs.c"

# cybergraphics.library (proto/ and inline/ come with vbcc)
put "$TMP/CGraphX-DevKit/CGraphX/C/Include" clib/cybergraphics_protos.h cybergraphx/cybergraphics.h

# NewMouse wheel events
put "$TMP/NewMouse12/NewMouse12" newmouse.h

# AsyncIO: headers, plus the link-library sources (built by src/Program)
X=$TMP/AsyncIO/AsyncIO
put "$X/include" libraries/asyncio.h clib/asyncio_protos.h
rm -rf "$SDK/asyncio"
mkdir -p "$SDK/asyncio"
for f in "$X"/src/*.c "$X"/src/*.h; do
    case $(basename "$f") in
        AsyncLib.c|AsyncLibVer.c|Lib.c|asynciolibsr.h) continue ;;
    esac
    # SAS/C pragmas -> NDK protos (vbcc ignores SAS #pragma libcall)
    sed -e 's|<pragmas/exec_sysbase_pragmas.h>|<proto/exec.h>|' \
        -e 's|<pragmas/dos_pragmas.h>|<proto/dos.h>|' \
        "$f" > "$SDK/asyncio/$(basename "$f")"
done
# It assigns NULL to BPTRs: give it the NDK's integer NULL (vbcc's libc
# headers define NULL as ((void *)0))
printf '\n#undef NULL\n#define NULL 0L\n' >> "$SDK/asyncio/async.h"

rm -rf "$TMP"
echo "SDK headers ready in $INC"
