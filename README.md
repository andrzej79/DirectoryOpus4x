# DirectoryOpus4x

Directory Opus 4 — the classic two-pane file manager for AmigaOS 3.x — built from
the GPL sources of the last release on Aminet,
**DOpus 4.16** ([biz/dopus/DOpus416JRsrc.lha](https://aminet.net/package/biz/dopus/DOpus416JRsrc), 2001-07-01).

- Original program: **Jonathan Potter**, GP Software (released under the GPL in January 2000)
- GPL releases after 4.12, up to 4.16: **Jacek Rzeuski**
- 4.17 (this repository): vbcc port, by **Andrzej Rogozynski**

This repository makes those sources build with a modern cross toolchain
(vbcc/vasm/vlink on macOS or Linux). The goals: first reproduce 4.16, then fix
bugs and add features.

## What gets built

| Component | Output | Installed as |
|-----------|--------|--------------|
| `src/Program`     | `DirectoryOpus` — the file manager | `DirectoryOpus` |
| `src/Library`     | `dopus.library` — shared GUI, requester, config and DOS support code | `Libs/dopus.library` |
| `src/Config`      | `ConfigOpus` — the configuration editor | `Modules/ConfigOpus` |
| `src/DOpus_Disk`  | Format, DiskCopy, Install module | `Modules/DOpus_Disk` |
| `src/DOpus_Icon`  | Icon information module | `Modules/DOpus_Icon` |
| `src/DOpus_Print` | Print / print directory module | `Modules/DOpus_Print` |
| `src/DOpusRT`     | `DOpusRT` — runs a command and waits for a key or mouse click | `C/DOpusRT` |

Every component is built for the **68020, without FPU instructions** (soft float).
The program needs Kickstart 3.0 or newer.

## Building

### Requirements

- **vbcc** (0.9h tested) with the `m68k-amigaos` target, plus **vasm** and **vlink**, installed in
  `/opt/amiga_sdk/vbcc`, with `vc`, `vasmm68k_mot` and `vlink` on `PATH` and `VBCC=/opt/amiga_sdk/vbcc`
- **Amiga NDK 3.2** (R4) in `/opt/amiga_sdk/NDK3.2R4` (`Include_H` for C, `Include_I` for asm)
- `python3`, `curl`, and `lha` (or `lhasa`) for fetching the third-party SDK files

### Third-party SDK files

DOpus uses a few third-party libraries when they are installed (xadmaster, xfdmaster,
powerpacker, popupmenu, screennotify, cybergraphics, NewMouse wheel events). Their developer
files are freely distributable, but most are not GPL, so they are not part of this repository.
Fetch them once:

```sh
tools/fetch_sdk.sh
```

This downloads the archives from Aminet, checks each against its SHA-256, and unpacks the
needed headers into the git-ignored `sdk/` directory. It also generates
vbcc inline headers for libraries whose kits lack them.

### Make targets

```sh
make            # build every component, then lay out build/DirectoryOpus4x
make -j8        # the same, in parallel
make clean      # remove build/
make install    # copy build/DirectoryOpus4x to TARGET_DIR (default ~/Documents/Amiga/amiga_uae_disk/)
make ftp        # build, then upload build/DirectoryOpus4x to Work:DirOpus4x/ on the Amiga
make lha        # build, then pack it into release/DirectoryOpus417.lha (needs lha, 1.14i-ac)
make protos     # regenerate src/include/inline/*_protos.h from the FD files
make -C src/Program   # build one component (output in build/Program/)
```

`make` does not clean first, and objects are rebuilt when any header in the component or in
`src/include` changes.

### FTP upload

`make ftp` uploads the distribution tree using `tools/ftpput.py`. It reads the login from
`ftp.local` in the project root (git-ignored), or from the environment:

```sh
cp ftp.local.example ftp.local     # then edit
```

```
AMIGA_FTP_HOST=192.168.x.y
AMIGA_FTP_USER=user
AMIGA_FTP_PASSWORD=password
```

The target directory defaults to `Work:DirOpus4x/` (override with `make ftp FTP_DIR=...`).
The volume must exist on the Amiga. The directory and its subdirectories are created
if they are missing.

## Installing on the Amiga

The distribution tree `build/DirectoryOpus4x` has the layout DOpus searches at run time
(`PROGDIR:C/`, `PROGDIR:Libs/`, `PROGDIR:Modules/`, `PROGDIR:S/`, then `C:`/`LIBS:`/`S:`, then
`DOpus:...`):

```
DirectoryOpus  DirectoryOpus.info
C/DOpusRT
Libs/dopus.library
Modules/ConfigOpus  Modules/DOpus_Disk  Modules/DOpus_Icon  Modules/DOpus_Print
S/DirectoryOpus.HLP  S/ConfigOpus.HLP  S/DO_<language>.HLP  S/CO_<language>.HLP
Catalogs/<language>/DOpus4.catalog  DOpus4_Config.catalog  DOpus4_Disk.catalog  ...
```

DOpus opens `dopus.library` from `LIBS:` first, and only then from `libs/` or
`DOpus:libs/`. If another version of the library is in `LIBS:` or already in memory, that
copy is used instead. When testing a new build, remove the old library, or run `avail flush`
after quitting DOpus.

The translations in `src/catalogs` (`<language>/*.ct`) are compiled by `tools/catcomp.py` into
`Catalogs/<language>/` of the distribution tree. locale.library looks there first
(`PROGDIR:Catalogs/`), then in `LOCALE:Catalogs/`. Strings a catalog lacks are shown in
English. The translated help files are next to them (`DO_<language>.HLP` for DirectoryOpus,
`CO_<language>.HLP` for ConfigOpus) and go to `S/`; without one, the English help is used. The
French catalogs and all help files come from the 4.16 binary release. The build also checks that each catalog description (`.cd`) matches the string enum and
the built-in English texts of its component.

## Repository layout

```
src/                 the DOpus 4.16 sources (one directory per component, see above)
src/include/         DOpus headers shared by all components, plus compiler.h (vbcc support)
src/common.mk        toolchain settings shared by the component Makefiles
src/*/makefile.gcc   the original GCC/PhxAss makefiles, for reference
src/catalogs/        locale catalog descriptions and translations
src/docs/            original developer notes (ARexx commands, string files, ...)
tools/fetch_sdk.sh   fetches the third-party SDK files into sdk/
tools/fd2vbcc.py     generates vbcc inline headers from FD files
tools/ftpput.py      FTP upload for make ftp
tools/amiSnapRemove.py  clears the snapshot position of Workbench icons (.info)
tools/catcomp.py     compiles the catalogs and checks the .cd files against the sources
```

## Changes from the original sources

The 4.16 sources were set up for GCC (geekgadgets/libnix) and PhxAss. To build them with vbcc:

- Register arguments `register T x __asm("a0")` are now `REG(a0, T x)` (`src/include/compiler.h`).
- SAS/C's `__aligned` stack structures (`FileInfoBlock`, `InfoData`) are now `D_S()` pointers.
- `NULL` is `0L` as in the NDK. The code uses it for integer fields too.
- `__saveds` and `__chip` come before the type, and functions that returned implicit `int` declare it.
- Chip-memory data sections are marked as `chip` for the hunk format.
- libnix's `detach.o` is replaced by `src/Program/detach.asm`. Started from a Shell,
  DirectoryOpus detaches and returns to the prompt, as before.
- Prebuilt GCC link libraries are gone. PCHG is built from source. AsyncIO is no longer used:
  files are copied with plain `Read()`/`Write()` in large chunks.
- `SysInfo.h` (public domain, no longer on Aminet) was rebuilt in `src/include/libraries/` from the
  Amiga-Oberon interface of the same release.

## License

Directory Opus 4 is free software under the **GNU General Public License, version 2 or later**;
see [LICENSE](LICENSE). The original release notes from Jonathan Potter are in
[src/README.txt](src/README.txt).

The names Directory Opus, DOpus and Opus are trademarks of GPSoftware. The GPL release does not
affect their status. Jonathan Potter's release notice allows the names to be used only for the
original and derived versions of Directory Opus 4, distributed as described in the GPL.
