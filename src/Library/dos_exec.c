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

int __saveds DoSendPacket(REG(a0, struct MsgPort *port), REG(d0, int action), REG(a1, ULONG *args), REG(d1, int nargs))
{
  struct StandardPacket *packet;
  struct MsgPort *repport;
  struct Process *myproc;
  int count, res1, a;
  ULONG *pargs;

  myproc = (struct Process *)FindTask(NULL);
  if (!(packet = AllocMem(sizeof(struct StandardPacket), MEMF_PUBLIC | MEMF_CLEAR)))
  {
    return (0);
  }
  if (!(repport = LCreatePort(NULL, 0)))
  {
    FreeMem(packet, sizeof(struct StandardPacket));
    return (0);
  }

  packet->sp_Msg.mn_Node.ln_Name = (char *)&(packet->sp_Pkt);
  packet->sp_Pkt.dp_Link         = &(packet->sp_Msg);
  packet->sp_Pkt.dp_Port         = repport;
  packet->sp_Pkt.dp_Type         = action;

  pargs = (ULONG *)&(packet->sp_Pkt.dp_Arg1);
  if (nargs > 7)
  {
    nargs = 7;
  }
  for (count = 0; count < nargs; count++)
  {
    pargs[count] = args[count];
  }

  PutMsg(port, (struct Message *)packet);
  WaitPort(repport);
  GetMsg(repport);

  res1 = packet->sp_Pkt.dp_Res1;
  a    = packet->sp_Pkt.dp_Res2;
  FreeMem(packet, sizeof(struct StandardPacket));
  LDeletePort(repport);
  if (myproc)
  {
    myproc->pr_Result2 = a;
  }
  return (res1);
}

struct DOpusPool
{
  APTR fast;
  APTR chip;
};

ULONG __saveds DoAllocRemember(REG(a0, struct DOpusRemember **key), REG(d0, ULONG size), REG(d1, ULONG type))
{
  APTR *pool;
  ULONG *mem;

  if (*key == NULL)
  {
    *key = AllocMem(sizeof(struct DOpusPool), MEMF_ANY | MEMF_CLEAR);
    if (*key == NULL)
    {
      return (0);
    }
  }
  // kprintf("LAllocRemember(%lx,%ld,%s): ",*key,size,(type & MEMF_CHIP)?"CHIP":"ANY");
  if (type & MEMF_CHIP)
  {
    pool = &((struct DOpusPool *)*key)->chip;
  } else
  {
    pool = &((struct DOpusPool *)*key)->fast;
  }

  if (*pool == NULL)
  {
    *pool = CreatePool(type | MEMF_CLEAR, 1024, 1024);
  }
  // kprintf("pool = %lx\t",*pool);
  size += sizeof(ULONG);
  if (*pool)
  {
    if (mem = AllocPooled(*pool, size))
    {
      // kprintf("mem = %lx\n",mem);
      mem[0] = size;
      return (ULONG)(mem + 1);
    }
  }
  // kprintf("error!\n");
  return 0;
  /*
      struct DOpusRemember *node,*cur;

      size+=sizeof(struct DOpusRemember);
      if (!(node=AllocMem(size,type))) return(NULL);
      node->next=NULL;
      if ((*key)==NULL) {
          node->current=node;
          (*key)=node;
      }
      else {
          cur=(*key)->current;
          (*key)->current=node;
          cur->next=node;
      }
      node->size=size;
      size=(ULONG)node+sizeof(struct DOpusRemember);
      return((ULONG)size);
  */
}

void __saveds DoFreeRemember(REG(a0, struct DOpusRemember **key))
{
  struct DOpusPool *pool = (struct DOpusPool *)(*key);
  if (*key)
  {
    // kprintf("LFreeRemember(%lx)\n",*key);
    if (pool->fast)
    {
      DeletePool(pool->fast);
    }
    if (pool->chip)
    {
      DeletePool(pool->chip);
    }
    FreeMem(*key, sizeof(struct DOpusPool));
    *key = NULL;
  }
  /*
      struct DOpusRemember *node,*cur;

      if ((*key)==NULL) return;
      node=(*key);
      while (node) {
          cur=node->next;
          FreeMem(node,node->size);
          node=cur;
      }
      (*key)=NULL;
  */
}

void __saveds DoFreeRemEntry(REG(a0, struct DOpusRemember **key), REG(a1, char *pointer))
{
  struct DOpusPool *pool;
  ULONG *ptr = (ULONG *)pointer;

  if ((*key) == NULL)
  {
    return;
  }
  if (TypeOfMem(pointer) & MEMF_CHIP)
  {
    pool = ((struct DOpusPool *)(*key))->chip;
  } else
  {
    pool = ((struct DOpusPool *)(*key))->fast;
  }

  FreePooled(pool, ptr - 1, *(ptr - 1));
  // kprintf("LFreeRemEntry(%lx,%lx): pool = %lx\n",*key,ptr-1,pool);
  /*
      struct DOpusRemember *node,*last=NULL;

      if ((*key)==NULL) return;
      pointer-=sizeof(struct DOpusRemember);

      node=(*key);
      while (node) {
          if (node==(struct DOpusRemember *)pointer) {
              if (last) last->next=node->next;
              if ((*key)->current==node) (*key)->current=last;
              if (node==(*key)) {
                  last=(*key)->current;
                  if (((*key)=node->next)) (*key)->current=last;
              }
              FreeMem(node,node->size);
              break;
          }
          last=node;
          node=node->next;
      }
  */
}

__saveds struct IORequest *DoCreateExtIO(REG(a0, struct MsgPort *port), REG(d0, int size))
{
  return CreateExtIO(port, size);
}

__saveds void DoDeleteExtIO(REG(a0, struct IORequest *extio))
{
  DeleteExtIO(extio);
}

__saveds struct MsgPort *DoCreatePort(REG(a0, char *name), REG(d0, int pri))
{
  return CreatePort(name, pri);
}

__saveds void DoDeletePort(REG(a0, struct MsgPort *port))
{
  DeletePort(port);
}
