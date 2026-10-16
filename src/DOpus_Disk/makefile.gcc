ASM = Work:Dev/PhxAss/bin/PhxAss
ASMOPTS = M=68020 SYMDEBUG SC SD 4
CCOPTS = -m68020 -fbaserel

OBJS = diskop.o data.o lsprintf.o format.o strings.o diskcopy.o install.o

All : DOpus_Disk

DOpus_Disk : $(OBJS)
	gcc -o DOpus_Disk $(OBJS) -noixemul $(CCOPTS) -s

.c.o:
	gcc -c $*.c $(CCOPTS) -I../include -msmall-code -Os

lsprintf.o: lsprintf.asm
	$(ASM) lsprintf.asm $(ASMOPTS)
	@hunk2aout >NIL: $*.o
	@delete $*.o QUIET
	@rename obj.0000.* $*.o
