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

#include "dopus.h"
#include <proto/xadmaster.h>

#define EXALL_NUM 2

int readarchive(struct DirectoryWindow *dir, int win)
{
  BPTR lock;
  long len, i;
  struct xadFileInfo *xfi;
  struct DateStamp ds;
  unsigned char arcname[256], arcdir[256], buf[FILEBUF_SIZE], buf2[FILEBUF_SIZE], *c;
  int type;

  strcpy(arcdir, "");
  D(bug("readarchive: %s\n", dir->directory)); // Delay(100);
  strcpy(arcname, dir->directory);
  if (len = strlen(arcname))
  {
    if (arcname[len - 1] == '/')
    {
      arcname[len - 1] = 0;
    }
  }
  while (!(lock = Lock(arcname, ACCESS_READ)))
  {
    c = FilePart(arcname);
    if (c == arcname)
    {
      return 0;
    }
    if (c > arcname)
    {
      *(c - 1) = 0;
    }
    strcpy(arcdir, dir->directory + (int)c - (int)arcname);
  }
  len = strlen(arcdir);
  // D(bug("arcdir: %s\n",arcdir));
  UnLock(lock);
  if (!dir->xai)
  {
    dostatustext(globstring[STR_OPENING_ARCHIVE]); // HUX
    if (dir->xadfh = Open(arcname, MODE_OLDFILE))
    {
      if (dir->xai = xadAllocObjectA(XADOBJ_ARCHIVEINFO, NULL))
      {
        D(bug("Allocated dir->xai: %lx\nOpening the archive...\n", dir->xai));
        if (xadGetInfo(dir->xai, XAD_INFILEHANDLE, (Tag)dir->xadfh, TAG_DONE) == 0)
        {
          D(bug("done\n"));
          dir->flags |= DWF_ARCHIVE;
        } else
        {
          D(bug("failed\n"));
          xadFreeObjectA(dir->xai, NULL);
          dir->xai = NULL;
          Close(dir->xadfh);
          dir->xadfh = NULL;
          return (0);
        }
      } else
      {
        Close(dir->xadfh);
        dir->xadfh = NULL;
        return (0);
      }
    } else
    {
      return (0);
    }
  } else
  {
    D(bug("dir->xai present: %lx\n", dir->xai));
  }
  // D(bug("archive: %s\tarcdir: %s\n",arcname,arcdir));
  if (xfi = dir->xai->xai_FileInfo)
  {
    // D(bug("xfi = %lx\n",xfi));
    buf2[0] = 0;
    while (xfi)
    {
      // D(bug("Object: %s\n",xfi->xfi_FileName));
      //            if ((len == 0) || (strncmp(arcdir,xfi->xfi_FileName,len) != 0))
      {
        c = xfi->xfi_FileName;
        // D(bug("arcdir: %s (%ld)\n",arcdir,len));
        for (i = 0; arcdir[i] == xfi->xfi_FileName[i]; i++)
        {
          c++;
        }
        if (i >= len)
        {
          for (i = 0; *c && (*c != '/') && (i < (FILEBUF_SIZE - 1)); i++, c++)
          {
            buf[i] = *c;
          }
          buf[i] = 0;

          // D(bug("dir cut: %s\n",buf));
          if (Stricmp(buf, buf2))
          {
            // D(bug("readarchive/add: %s\n",buf));
            if (*c == '/')
            {
              type = ST_USERDIR;
            } else
            {
              type = ST_FILE;
            }

            if ((xfi->xfi_Flags & XADFIF_DIRECTORY) == XADFIF_DIRECTORY)
            {
              type = ST_USERDIR;
            }

            xadConvertDates(XAD_DATEXADDATE, (Tag)&xfi->xfi_Date, XAD_GETDATEDATESTAMP, (Tag)&ds, TAG_END);

            addfile(dir, win, buf, type > 0 ? -1 : xfi->xfi_Size, type, &ds, xfi->xfi_Comment, xfi->xfi_Protection, 0,
                    FALSE, NULL, NULL, xfi->xfi_OwnerUID, xfi->xfi_OwnerGID);
            strcpy(buf2, buf);
          }
        }
      }
      xfi = xfi->xfi_Next;
    }
    dostatustext(globstring[STR_OKAY_TITLE]); // HUX
    //     dostatustext("OK");
    return (1);
  }
  return (0);
}

void freearchive(struct DirectoryWindow *dir)
{
  if (dir->xai)
  {
    D(bug("Freeing dir->xai: %lx\n", dir->xai));
    xadFreeInfo(dir->xai);
    if (dir->xadfh)
    {
      Close(dir->xadfh);
    }
    dir->xadfh = NULL;
    xadFreeObject(dir->xai, TAG_END);
    dir->xai = NULL;
  }
}

BOOL unarcfiledir(const struct DirectoryWindow *dir, const char *path, char *namebuf, const char *file)
{
  if (dir->xai)
  {
    if (dir->xadfh)
    {
      struct xadFileInfo *xfi;
      char arcname[256], arcdir[256], *c;
      int i;

      if (NameFromFH(dir->xadfh, arcname, 256))
      {
        c = strstr(dir->directory, FilePart(arcname));
        if (c)
        {
          for (; c && (*c != '/'); c++)
            ;
        }
        if (c)
        {
          c++;
        }
        strcpy(arcdir, c ? c : "");
      } else
      {
        BPTR lock;

        strcpy(arcdir, "");
        // D(bug("Get dir: %s\n",dir->directory));
        strcpy(arcname, dir->directory);
        if (i = strlen(arcname))
        {
          if (arcname[i - 1] == '/')
          {
            arcname[i - 1] = 0;
          }
        }
        while (!(lock = Lock(arcname, ACCESS_READ)))
        {
          c = FilePart(arcname);
          if (c > arcname)
          {
            *(c - 1) = 0;
          }
          strcpy(arcdir, dir->directory + (int)c - (int)arcname);
        }
        UnLock(lock);
      }
      AddPart(arcdir, file, 256);
      strcpy(namebuf, "dopustmp");
      lsprintf(arcname, "%08lx", GetUniqueID());
      strcat(namebuf, arcname);
      c = strchr(file, '.');
      if (c)
      {
        strcat(namebuf, c);
      }
      strcpy(arcname, path);
      strcat(arcname, namebuf);
      for (xfi = dir->xai->xai_FileInfo; xfi; xfi = xfi->xfi_Next)
      {
        if (LStrCmp(xfi->xfi_FileName, arcdir) == 0)
        {
          break;
        }
      }
      if (xfi)
      {
        if (!(xadFileUnArc(dir->xai, XAD_ENTRYNUMBER, xfi->xfi_EntryNumber, XAD_OUTFILENAME, (ULONG)arcname, TAG_END)))
        {
          return TRUE;
        }
      }
    }
  }
  return FALSE;
}
