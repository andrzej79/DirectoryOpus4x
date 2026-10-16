#ifndef CLIB_SYSINFO_PROTOS_H
#define CLIB_SYSINFO_PROTOS_H
/* SysInfo.library 1.30 prototypes (public domain, see libraries/SysInfo.h) */

#ifndef LIBRARIES_SYSINFO_H
#include <libraries/SysInfo.h>
#endif
#ifndef EXEC_TASKS_H
#include <exec/tasks.h>
#endif

struct SysInfo *InitSysInfo(void);
void FreeSysInfo(struct SysInfo *si);
void GetLoadAverage(struct SysInfo *si, struct SI_LoadAverage *la);
LONG GetPid(struct SysInfo *si);
LONG GetPpid(struct SysInfo *si);
LONG GetPgrp(struct SysInfo *si);
LONG GetNice(struct SysInfo *si, LONG which, LONG who);
LONG SetNice(struct SysInfo *si, LONG which, LONG who, LONG nice);
struct SI_Notify *AddNotify(struct SysInfo *si, UWORD flags, LONG safety_limit);
void RemoveNotify(struct SysInfo *si, struct SI_Notify *notify);
void GetCpuUsage(struct SysInfo *si, struct SI_CpuUsage *usage);
LONG GetTaskCpuUsage(struct SysInfo *si, struct SI_TaskCpuUsage *usage, struct Task *task);

#endif /* CLIB_SYSINFO_PROTOS_H */
