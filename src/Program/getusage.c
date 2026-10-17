/*

Directory Opus 4

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

CPU usage for the clock, when sysinfo.library is not used.

Exec's IdleCount and DispCount count events (going idle, task switches),
not time, so their ratio says little about how busy the CPU is.  Instead a
vertical blank interrupt samples, 50 or 60 times a second, whether a task
was running: while one runs, ThisTask is in TS_RUN; while the CPU idles in
exec's dispatcher, ThisTask still points to the last task, which is waiting.

*/

#include <proto/exec.h>
#include <exec/execbase.h>
#include <exec/interrupts.h>
#include <hardware/intbits.h>
#include <compiler.h>

static struct
{
  ULONG samples, busy;
} cpu_count;

static struct Interrupt cpu_int;
static int cpu_int_added;

static __amigainterrupt ULONG cpu_sample(REG(a1, APTR data))
{
  struct Task *task = SysBase->ThisTask;

  ++cpu_count.samples;
  if (task && task->tc_State == TS_RUN)
  {
    ++cpu_count.busy;
  }
  return (0); /* let the other vertical blank servers run */
}

/* CPU usage in percent since the previous call; 0 on the first one */
int getusage(void)
{
  ULONG samples, busy;

  if (!cpu_int_added)
  {
    cpu_int.is_Node.ln_Type = NT_INTERRUPT;
    cpu_int.is_Node.ln_Pri  = 0;
    cpu_int.is_Node.ln_Name = "dopus_cpu";
    cpu_int.is_Data         = &cpu_count;
    cpu_int.is_Code         = (void (*)())cpu_sample;
    AddIntServer(INTB_VERTB, &cpu_int);
    cpu_int_added = 1;
    return (0);
  }

  Disable();
  samples           = cpu_count.samples;
  busy              = cpu_count.busy;
  cpu_count.samples = cpu_count.busy = 0;
  Enable();

  return (samples ? (int)(busy * 100 / samples) : 0);
}

/* Remove the interrupt server: call before the program quits */
void freeusage(void)
{
  if (cpu_int_added)
  {
    RemIntServer(INTB_VERTB, &cpu_int);
    cpu_int_added = 0;
  }
}
