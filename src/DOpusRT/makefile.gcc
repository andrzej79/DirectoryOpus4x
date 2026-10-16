ASM = Work:Dev/PhxAss/bin/PhxAss
ASMOPTS = M=68020 SYMDEBUG SC SD 4
CCOPTS = -m68020 -fbaserel

All: DOpusRT.o dopusrtasm.o
	gcc -o DOpusRT *.o -noixemul $(CCOPTS) -s -resident

DOpusRT.o: DOpusRT.c
	gcc -c DOpusRT.c -O2 $(CCOPTS) -fomit-frame-pointer -msmall-code

dopusrtasm.o: dopusrtasm.asm
	$(ASM) dopusrtasm.asm $(ASMOPTS)
	@hunk2aout >NIL: $*.o
	@delete $*.o QUIET
	@rename obj.0000.* $*.o
