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

#include "dopuslib.h"

struct Image *get_image_data(struct DOpusRemember **, int, int, int, struct BitMap *, struct RastPort *);
void drawline(struct RastPort *rp, int, int, int, int);

void __saveds DoDoArrow(REG(a0, struct RastPort *p), REG(d0, int x), REG(d1, int y), REG(d2, int w), REG(d3, int h),
                        REG(d4, int fg), REG(d5, int bg), REG(d6, int d))
{
  int x1, y1, x2, y2, x3, y3, x4, y4, xb;

  SetAPen(p, bg);
  xb = x + w;
  RectFill(p, x, y, xb - 1, y + h - 1);
  SetAPen(p, fg);
  switch (d)
  {
  case 0:
    y1 = y + h - 2;
    y3 = y + 1;
    goto sameupdown;

  case 1:
    y1 = y + 1;
    y3 = y + h - 2;
  sameupdown:
    x1 = x + 2;
    x2 = xb - 3;
    x3 = x + (w / 2) - 1;
    x4 = xb - (w / 2);
    y2 = y1;
    y4 = y3;
    break;

  case 2:
    x1 = x + 1;
    x3 = xb - 2;
    goto sameleftright;

  case 3:
    x1 = xb - 2;
    x3 = x + 1;
  sameleftright:
    x2 = x1;
    y1 = y + 1;
    y2 = y + h - 2;
    y3 = y + (h / 2);
    if (h % 2 == 0)
    {
      --y3;
    }
    x4 = x3;
    y4 = y3;
    break;
  }
  drawline(p, x1, y1, x3, y3);
  drawline(p, x2, y2, x4, y4);
}

void __saveds DoDrawRadioButton(REG(a0, struct RastPort *rp), REG(d0, int x), REG(d1, int y), REG(d2, int w),
                                REG(d3, int h), REG(d4, int hi), REG(d5, int lo))
{
  SetAPen(rp, hi);
  drawline(rp, x, y - 1, x + w - 3, y - 1);
  drawline(rp, x - 1, y, x, y);
  drawline(rp, x - 2, y + 1, x - 2, y + h - 4);
  drawline(rp, x - 1, y + 1, x - 1, y + h - 4);
  drawline(rp, x - 1, y + h - 3, x, y + h - 3);
  SetAPen(rp, lo);
  drawline(rp, x, y + h - 2, x + w - 3, y + h - 2);
  drawline(rp, x + w - 3, y + h - 3, x + w - 2, y + h - 3);
  drawline(rp, x + w - 1, y + h - 4, x + w - 1, y + 1);
  drawline(rp, x + w - 2, y + h - 4, x + w - 2, y + 1);
  drawline(rp, x + w - 3, y, x + w - 2, y);
}

void drawline(rp, x1, y1, x2, y2) struct RastPort *rp;
int x1, y1, x2, y2;
{
  Move(rp, x1, y1);
  Draw(rp, x2, y2);
}

__saveds struct Image *DoGetButtonImage(REG(d0, int w), REG(d1, int h), REG(d2, int fg), REG(d3, int bg),
                                        REG(d4, int fpen), REG(d5, int bpen), REG(a0, struct DOpusRemember **key))
{
  struct Image *image;
  short a, b, depth;
  struct BitMap tbm;
  struct RastPort trp;

  b = (fg > bg) ? fg : bg;
  if (fpen > b)
  {
    b = fpen;
  }
  if (bpen > b)
  {
    b = bpen;
  }

  depth = 2;
  w += 4;
  for (a = 0; a < 8; a++)
  {
    if (b & (1 << a))
    {
      depth = a + 1;
    }
  }

  if (!(image = get_image_data(key, w, h, depth, &tbm, &trp)))
  {
    return (NULL);
  }

  SetAPen(&trp, bpen);
  RectFill(&trp, 0, 0, w - 1, h - 1);
  DoDrawRadioButton(&trp, 2, 1, w - 4, h, (fpen != bpen) ? bg : fg, (fpen != bpen) ? fg : bg);
  if (w > 10 && h > 4 && fpen != bpen)
  {
    SetAPen(&trp, fpen);
    RectFill(&trp, 4, 2, w - 7, h - 3);
    SetAPen(&trp, bpen);
    WritePixel(&trp, 4, 2);
    WritePixel(&trp, 4, h - 3);
    WritePixel(&trp, w - 7, 2);
    WritePixel(&trp, w - 7, h - 3);
  }

  image->LeftEdge = -2;
  image->TopEdge  = -1;
  return (image);
}

__saveds struct Image *DoGetCheckImage(REG(d0, int fg), REG(d1, int bg), REG(d2, int pen),
                                       REG(a0, struct DOpusRemember **key))
{
  struct Image *image;
  int a, b, depth;
  struct BitMap tbm;
  struct RastPort trp;

  b     = (fg > bg) ? fg : bg;
  depth = 2;
  for (a = 0; a < 8; a++)
  {
    if (b & (1 << a))
    {
      depth = a + 1;
    }
  }

  if (!(image = get_image_data(key, 13, 7, depth, &tbm, &trp)))
  {
    return (NULL);
  }

  SetDrMd(&trp, JAM1);
  SetAPen(&trp, bg);
  RectFill(&trp, 0, 0, 12, 6);
  if (pen)
  {
    SetAPen(&trp, fg);
    BltTemplate((char *)DOpusBase->pdb_check, 0, 2, &trp, 0, 0, 13, 7);
  }

  image->LeftEdge = 7;
  image->TopEdge  = 2;
  return (image);
}

void __saveds DoDo3DFrame(REG(a0, struct RastPort *rp), REG(d0, int x), REG(d1, int y), REG(d2, int w), REG(d3, int h),
                          REG(a1, char *title), REG(d4, int hi), REG(d5, int lo))
{
  char of, ob;
  int a, l;

  of = rp->FgPen;
  ob = rp->BgPen;
  Do3DBox(rp, x + 2, y + 1, w - 4, h - 2, lo, hi);
  Do3DBox(rp, x + 4, y + 2, w - 8, h - 4, hi, lo);
  SetAPen(rp, of);
  SetBPen(rp, ob);
  if (title)
  {
    a = strlen(title);
    x += ((w - (l = (TextLength(rp, title, a)))) / 2);
    SetAPen(rp, ob);
    RectFill(rp, x - rp->Font->tf_XSize / 2, y + 2 - rp->Font->tf_Baseline, x + l + rp->Font->tf_XSize / 2,
             y + 2 - rp->Font->tf_Baseline + rp->Font->tf_YSize);
    SetAPen(rp, of);
    Move(rp, x, y + 2);
    Text(rp, title, a);
  }
}

extern USHORT __chip glass_image1[];
extern USHORT __chip glass_image2[];

void __saveds DoDoGlassImage(REG(a0, struct RastPort *rp), REG(a1, struct Gadget *gadget), REG(d0, int shine),
                             REG(d1, int shadow), REG(d2, int type))
{
  int x, y;
  char op, om;

  om = rp->DrawMode;
  op = rp->FgPen;
  SetDrMd(rp, JAM1);

  if (type == 0)
  {
    x = gadget->LeftEdge + ((gadget->Width - 16) / 2);
    y = gadget->TopEdge + ((gadget->Height - 8) / 2);

    SetAPen(rp, shine);
    BltTemplate((char *)glass_image2, 0, 2, rp, x, y, 16, 8);
    SetAPen(rp, shadow);
    BltTemplate((char *)glass_image1, 0, 2, rp, x, y, 16, 8);
  }

  SetAPen(rp, op);
  SetDrMd(rp, om);
}

struct Image *get_image_data(key, width, height, depth, bm, rp)
struct DOpusRemember **key;
int width, height, depth;
struct BitMap *bm;
struct RastPort *rp;
{
  struct Image *image;
  USHORT *data;
  short a, words;

  words = (width + 15) / 16;

  if (!(image = LAllocRemember(key, sizeof(struct Image), MEMF_CLEAR)) ||
      !(data = LAllocRemember(key, words * 2 * height * depth, MEMF_CHIP | MEMF_CLEAR)))
  {
    return (NULL);
  }

  InitBitMap(bm, depth, width, height);
  for (a = 0; a < depth; a++)
  {
    bm->Planes[a] = (PLANEPTR)&data[words * height * a];
  }
  InitRastPort(rp);
  rp->BitMap = bm;

  image->Width     = width;
  image->Height    = height;
  image->Depth     = depth;
  image->ImageData = data;
  image->PlanePick = (1 << depth) - 1;

  return (image);
}
