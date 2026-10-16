ASM = Work:Dev/PhxAss/bin/PhxAss
ASMOPTS = INCPATH Include: M=68020 SYMDEBUG SC SD 4
CCOPTS = -m68020 -fbaserel

OBJS = data.o borders.o dates.o dopus_stuff.o dospaths.o dos_exec.o \
filereq.o graphics.o gui.o imagery.o language.o listview.o misc.o \
requesters.o simplerequest.o strings.o wildcard.o menus.o functions2.o \
functions.o dopuslib.o

all: dopus.library

dopus.library: $(OBJS)
	gcc -o dopus.library -nostartfiles $(OBJS) -noixemul $(CCOPTS) -ldebug
# -s

.c.o:
	gcc -c $*.c $(CCOPTS) -I../include -msmall-code -Os

data.o: data.a
	$(ASM) data.a $(ASMOPTS)

.a.o:
	$(ASM) $*.a $(ASMOPTS)
	@hunk2aout >NIL: $*.o
	@delete $*.o QUIET
	@rename obj.0000.* $*.o
