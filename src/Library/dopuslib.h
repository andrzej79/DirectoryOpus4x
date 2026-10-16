/*

Directory Opus 4
Original GPL release version 4.12
Copyright 1993-2000 Jonathan Potter

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

All users of Directory Opus 4 (including versions distributed
under the GPL) are entitled to upgrade to the latest version of
Directory Opus version 5 at a reduced price. Please see
http://www.gpsoft.com.au for more information.

The release of Directory Opus 4 under the GPL in NO WAY affects
the existing commercial status of Directory Opus 5.

*/

#ifdef DEBUG
  #define bug kprintf
  #define D(x) x
#else
  #define D(x)
#endif

//#include <fctype.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
#include <exec/types.h>
#include <exec/memory.h>
#include <exec/execbase.h>
#include <dos/dos.h>
#include <dos/dosextens.h>
/*
#include <dos/exall.h>
*/
#include <intuition/intuitionbase.h>
#include <intuition/sghooks.h>
#include <graphics/gfxbase.h>
#include <graphics/gfxmacros.h>
#include <libraries/commodities.h>
#include <workbench/workbench.h>
#include <workbench/startup.h>
/*
#include <devices/audio.h>
#include <devices/input.h>
#include <devices/keyboard.h>
#include <devices/trackdisk.h>
#include <devices/printer.h>
#include <devices/prtbase.h>
#include <devices/conunit.h>
#include <hardware/intbits.h>
#include <datatypes/datatypesclass.h>
*/
#include <proto/all.h>
#include <compiler.h>
#include <proto/dopus.h>

extern struct ExecBase *SysBase;
extern struct DOpusBase *DOpusBase;
extern struct IntuitionBase *IntuitionBase;
extern struct GfxBase *GfxBase;
extern struct DosLibrary *DOSBase;
extern struct Library *LayersBase;

/* dosstuff.c */

/* functions.a: RawDoFmt() into a buffer, arguments on the stack */
void LSprintf(char *buf, char *fmt, ...);

int __saveds DoAssign(REG(a0, char *name),
    REG(a1, char *dir));

__saveds char *DoBaseName(REG(a0, char *path));

int __saveds DoCompareLock(REG(a0, BPTR l1),
    REG(a1, BPTR l2));

int __saveds DoPathName(REG(a0, BPTR lock),
    REG(a1, char *buf),
    REG(d0, int len));

int __saveds DoSendPacket(REG(a0, struct MsgPort *port),
    REG(d0, int action),
    REG(a1, ULONG *args),
    REG(d1, int nargs));

int __saveds DoTackOn(REG(a0, char *path),
    REG(a1, char *file),
    REG(d0, int len));

int __saveds DoStampToStr(REG(a0, struct DOpusDateTime *dt));

int __saveds DoStrToStamp(REG(a0, struct DOpusDateTime *dt));

ULONG __saveds DoAllocRemember(REG(a0, struct DOpusRemember **key),
    REG(d0, ULONG size),
    REG(d1, ULONG type));

void __saveds DoFreeRemember(REG(a0, struct DOpusRemember **key));

void __saveds DoFreeRemEntry(REG(a0, struct DOpusRemember **key),
    REG(a1, char *pointer));

int __saveds DoCompareDate(REG(a0, struct DateStamp *date),
    REG(a1, struct DateStamp *date2));

void __saveds DoDoArrow(REG(a0, struct RastPort *),
    REG(d0, int),
    REG(d1, int),
    REG(d2, int),
    REG(d3, int),
    REG(d4, int),
    REG(d5, int),
    REG(d6, int));

int __saveds DoStrCombine(REG(a0, char *buf),
    REG(a1, char *one),
    REG(a2, char *two),
    REG(d0, int lim));

int __saveds DoStrConcat(REG(a0, char *buf),
    REG(a1, char *cat),
    REG(d0, int lim));

void __saveds DoDecode_RLE(REG(a0, char *source),
    REG(a1, char *dest),
    REG(d0, int size));

/* dosstuff2.c */

int __saveds DoSearchPathList(REG(a0, char *),
    REG(a1, char *),
    REG(d0, int));

int __saveds DoCheckExist(REG(a0, char *),
    REG(a1, int *));

int __saveds DoRawkeyToStr(REG(d0, USHORT),
    REG(d1, USHORT),
    REG(a0, char *),
    REG(a1, char *),
    REG(d2, int));

int __saveds DoDoRMBGadget(REG(a0, struct RMBGadget *),
    REG(a1, struct Window *));

int __saveds DoAddGadgets(REG(a0, struct Window *),
    REG(a1, struct Gadget *),
    REG(a2, char **),
    REG(d0, int),
    REG(d1, int),
    REG(d2, int),
    REG(d3, int));

int __saveds DoCheckNumGad(REG(a0, struct Gadget *),
    REG(a1, struct Window *),
    REG(d0, int),
    REG(d1, int));

int __saveds DoCheckHexGad(REG(a0, struct Gadget *),
    REG(a1, struct Window *),
    REG(d0, int),
    REG(d1, int));

int __saveds DoAtoh(REG(a0, unsigned char *),
    REG(d0, int));

int __saveds DoDoSimpleRequest(REG(a0, struct Window *),
    REG(a1, struct DOpusSimpleRequest *));

void __saveds DoDoCycleGadget(REG(a0, struct Gadget *),
    REG(a1, struct Window *),
    REG(a2, char **),
    REG(d0, int));

void __saveds DoDrawRadioButton(REG(a0, struct RastPort *),
    REG(d0, int),
    REG(d1, int),
    REG(d2, int),
    REG(d3, int),
    REG(d4, int),
    REG(d5, int));

__saveds struct Image *DoGetButtonImage(REG(d0, int),
    REG(d1, int),
    REG(d2, int),
    REG(d3, int),
    REG(d4, int),
    REG(d5, int),
    REG(a0, struct DOpusRemember **));

__saveds struct Image *DoGetCheckImage(REG(d0, int fg),
    REG(d1, int bg),
    REG(d2, int pen),
    REG(a0, struct DOpusRemember **key));

void __saveds DoUScoreText(REG(a0, struct RastPort *),
    REG(a1, char *),
    REG(d0, int),
    REG(d1, int),
    REG(d2, int));

void __saveds DoDo3DFrame(REG(a0, struct RastPort *),
    REG(d0, int),
    REG(d1, int),
    REG(d2, int),
    REG(d3, int),
    REG(a1, char *),
    REG(d4, int),
    REG(d5, int));

void __saveds DoDoGlassImage(REG(a0, struct RastPort *rp),
    REG(a1, struct Gadget *gadget),
    REG(d0, int shine),
    REG(d1, int shadow),
    REG(d2, int type));

/* dosstuff3.c */

int __saveds DoReadConfig(REG(a0, char *),
    REG(a1, struct ConfigStuff *));

int __saveds DoSaveConfig(REG(a0, char *),
    REG(a1, struct ConfigStuff *));

int __saveds DoDefaultConfig(REG(a0, struct ConfigStuff *));

int __saveds DoGetDevices(REG(a0, struct ConfigStuff *));

void __saveds DoAssignGadget(REG(a0, struct ConfigStuff *),
    REG(d0, int),
    REG(d1, int),
    REG(a1, char *),
    REG(a2, char *));

void __saveds DoAssignMenu(REG(a0, struct ConfigStuff *),
    REG(d0, int),
    REG(a1, char *),
    REG(a2, char *));

void __saveds DoFreeConfig(REG(a0, struct ConfigStuff *));

int __saveds DoCheckConfig(REG(a0, struct ConfigStuff *));

int __saveds DoFindSystemFile(REG(a0, char *),
    REG(a1, char *),
    REG(d0, int),
    REG(d1, int));

/* filereq.c */

int __saveds DoFileRequest(REG(a0, struct DOpusFileReq *));

void __saveds DoSetBusyPointer(REG(a0, struct Window *));

/* listview.c */

int __saveds DoAddListView(REG(a0, struct DOpusListView *),
    REG(d0, int));

void __saveds DoFixSliderBody(REG(a0, struct Window *win),
  REG(a1, struct Gadget *gad),
  REG(d0, int count),
  REG(d1, int lines),
  REG(d2, int show));

void __saveds DoFixSliderPot(REG(a0, struct Window *win),
  REG(a1, struct Gadget *gad),
  REG(d0, int off),
  REG(d1, int count),
  REG(d2, int lines),
  REG(d3, int show));

void __saveds DoShowSlider(REG(a0, struct Window *),
    REG(a1, struct Gadget *));

int __saveds DoGetSliderPos(REG(a0, struct Gadget *gad),
  REG(d0, int count),
  REG(d1, int lines));

__saveds struct DOpusListView *DoListViewIDCMP(
    REG(a0, struct DOpusListView *),
    REG(a1, struct IntuiMessage *));

int __saveds DoRefreshListView(REG(a0, struct DOpusListView *),
    REG(d0, int));

int __saveds DoRemoveListView(REG(a0, struct DOpusListView *),
    REG(d0, int));

/* wildcard.c */


int __saveds DoMatchPattern(REG(a0, unsigned char *pat),
    REG(a1, unsigned char *str),
    REG(d0, int cas));

void __saveds DoParsePattern(REG(a0, unsigned char *pat),
    REG(a1, unsigned char *patbuf),
    REG(d0, int cas));

/* requesters.c */

__saveds struct Window *R_OpenRequester(
    REG(a0, struct RequesterBase *));

void __saveds R_CloseRequester(
    REG(a0, struct RequesterBase *));

APTR __saveds R_AddRequesterObject(
    REG(a0, struct RequesterBase *),
    REG(a1, struct TagItem *));

void __saveds R_RefreshRequesterObject(
    REG(a0, struct RequesterBase *),
    REG(a1, struct RequesterObject *));

void __saveds R_ObjectText(REG(a0, struct RequesterBase *reqbase),
    REG(d0, short left),
    REG(d1, short top),
    REG(d2, short width),
    REG(d3, short height),
    REG(a1, char *text),
    REG(d4, unsigned short textpos));

/* language.c */

int __saveds DoReadStringFile(
    REG(a0, struct StringData *),
    REG(a1, char *));

void __saveds DoFreeStringFile(
    REG(a0, struct StringData *));

/* borders.c */

void __saveds DoAddGadgetBorders(REG(a0, struct DOpusRemember **),
    REG(a1, struct Gadget *),
    REG(d0, int),
    REG(d1, int),
    REG(d2, int));

void __saveds DoCreateGadgetBorders(REG(a0, struct DOpusRemember **),
    REG(d0, int),
    REG(d1, int),
    REG(a1, struct Border **),
    REG(a2, struct Border **),
    REG(d2, int),
    REG(d3, int),
    REG(d4, int));

void __saveds DoSelectGadget(REG(a0, struct Window *),
    REG(a1, struct Gadget *));

/* menus.c */

int __saveds DoFSSetMenuStrip(REG(a0, struct Window *),
    REG(a1, struct Menu *));

/* functions.a */

void SwapMem(REG(a0, char *), REG(a1, char *), REG(d0, int));
struct IORequest *DoCreateExtIO(REG(a0, struct MsgPort *port), REG(d0, int size));
void DoDeleteExtIO(REG(a0, struct IORequest *extio));
struct MsgPort *DoCreatePort(REG(a0, char *name), REG(d0, int pri));
void DoDeletePort(REG(a0, struct MsgPort *port));



