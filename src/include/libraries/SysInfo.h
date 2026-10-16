#ifndef LIBRARIES_SYSINFO_H
#define LIBRARIES_SYSINFO_H
/*
**	SysInfo.library definitions (SysInfo Release 1.30)
**
**	The original SysInfo.h 1.30 (14.11.95) by Petri Nordlund is public
**	domain.  It is not on Aminet any more; this file was rebuilt from the
**	Amiga-Oberon interface on Aminet (dev/obero/SysInfo_Oberon.lha), which is
**	a 1:1 conversion of it.  Layout and LVOs match that interface.
*/

#ifndef EXEC_TYPES_H
#include <exec/types.h>
#endif
#ifndef EXEC_PORTS_H
#include <exec/ports.h>
#endif

#define SYSINFONAME	"SysInfo.library"
#define SYSINFOVERSION	1

/* Returned by InitSysInfo(); READ-ONLY, and it may grow in the future */
struct SysInfo {
	LONG	si_errno;		/* "errno": error values from some functions */

	/* load average */
	UWORD	loadavg_type;		/* see below */
	UWORD	loadavg_time1;		/* usually 1, 5 and 15 minutes, */
	UWORD	loadavg_time2;		/* in seconds; 0 = not implemented */
	UWORD	loadavg_time3;
	UWORD	fscale;			/* scale, if loadavg_type is FIXEDPNT */

	/* id */
	BOOL	GetPpid_implemented;
	BOOL	GetPgrp_implemented;

	/* get/setnice */
	UWORD	which_implemented;	/* WHICHF_* search methods */
	WORD	nicemin;		/* nice value giving most cpu time */
	WORD	nicemax;		/* nice value giving least cpu time */

	/* notify */
	BOOL	notify_sig_implemented;
	BOOL	notify_msg_implemented;

	/* cpu usage */
	UWORD	cpu_usage_implemented;		/* CPU_USAGEF_* */
	UWORD	task_cpu_usage_implemented;	/* TASK_CPU_USAGEF_* */

	ULONG	reserved[8];
};

/* errno values */
#define SI_ERR_EPERM	1
#define SI_ERR_ESRCH	3
#define SI_ERR_EACCES	13
#define SI_ERR_EINVAL	22

/* loadavg_type */
#define LOADAVG_NONE		0
#define LOADAVG_FIXEDPNT	1

struct SI_LoadAverage {
	ULONG	lavg_ld1;
	ULONG	lavg_ld2;
	ULONG	lavg_ld3;
	ULONG	reserved[3];
};

/* Get/SetNice() search methods, bits of which_implemented */
#define WHICH_PRIO_PROCESS	0
#define WHICH_PRIO_PGRP		1
#define WHICH_PRIO_USER		2
#define WHICH_PRIO_TASK		3
#define WHICHF_PRIO_PROCESS	(1<<WHICH_PRIO_PROCESS)
#define WHICHF_PRIO_PGRP	(1<<WHICH_PRIO_PGRP)
#define WHICHF_PRIO_USER	(1<<WHICH_PRIO_USER)
#define WHICHF_PRIO_TASK	(1<<WHICH_PRIO_TASK)

struct SI_Notify {
	struct MsgPort	*notify_port;
	WORD		notify_signal;
	LONG		reserved[2];
};

/* AddNotify() flags */
#define AN_USE_MESSAGES		(1<<0)

struct SI_CpuUsage {
	ULONG	total_used_cputime;		/* seconds */
	ULONG	total_elapsed_time;		/* used + idle, seconds */

	ULONG	used_cputime_lastsec;		/* 100 * lastsec / lastsec_hz = CPU % */
	ULONG	used_cputime_lastsec_hz;

	ULONG	recent_used_cputime;		/* 100 * recent / recent_hz = CPU % */
	ULONG	recent_used_cputime_hz;
	UWORD	recent_seconds;			/* "recent" is this many seconds */

	ULONG	involuntary_csw;
	ULONG	voluntary_csw;
	ULONG	total_csw;

	ULONG	involuntary_csw_lastsec;
	ULONG	voluntary_csw_lastsec;
	ULONG	total_csw_lastsec;

	ULONG	reserved[12];
};

/* bits of cpu_usage_implemented */
#define CPU_USAGEF_TOTAL_IMPLEMENTED		(1<<0)
#define CPU_USAGEF_LASTSEC_IMPLEMENTED		(1<<1)
#define CPU_USAGEF_RECENT_IMPLEMENTED		(1<<2)
#define CPU_USAGEF_IVVOCSW_IMPLEMENTED		(1<<3)
#define CPU_USAGEF_TOTALCSW_IMPLEMENTED		(1<<4)
#define CPU_USAGEF_IVVOCSW_LASTSEC_IMPLEMENTED	(1<<5)
#define CPU_USAGEF_TOTALCSW_LASTSEC_IMPLEMENTED	(1<<6)

struct SI_TaskCpuUsage {
	ULONG	total_used_cputime;
	ULONG	total_used_time_hz;		/* used_cputime / hz = seconds */
	ULONG	total_elapsed_time;

	ULONG	used_cputime_lastsec;
	ULONG	used_cputime_lastsec_hz;

	ULONG	recent_used_cputime;
	ULONG	recent_used_cputime_hz;
	UWORD	recent_seconds;

	ULONG	involuntary_csw;
	ULONG	voluntary_csw;
	ULONG	total_csw;

	ULONG	involuntary_csw_lastsec;
	ULONG	voluntary_csw_lastsec;
	ULONG	total_csw_lastsec;

	ULONG	reserved[8];
};

/* bits of task_cpu_usage_implemented */
#define TASK_CPU_USAGEF_TOTAL_IMPLEMENTED		(1<<0)
#define TASK_CPU_USAGEF_LASTSEC_IMPLEMENTED		(1<<1)
#define TASK_CPU_USAGEF_RECENT_IMPLEMENTED		(1<<2)
#define TASK_CPU_USAGEF_IVVOCSW_IMPLEMENTED		(1<<3)
#define TASK_CPU_USAGEF_TOTALCSW_IMPLEMENTED		(1<<4)
#define TASK_CPU_USAGEF_IVVOCSW_LASTSEC_IMPLEMENTED	(1<<5)
#define TASK_CPU_USAGEF_TOTALCSW_LASTSEC_IMPLEMENTED	(1<<6)

#endif /* LIBRARIES_SYSINFO_H */
