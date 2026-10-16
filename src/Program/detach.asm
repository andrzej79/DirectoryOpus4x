; Directory Opus 4
;
; This program is free software; you can redistribute it and/or
; modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation; either version 2
; of the License, or (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; Detach from the Shell, as libnix' detach.o did for the GCC build.
;
; Started from a Shell, DirectoryOpus starts itself again as a background
; process (same seglist, same arguments, task name __procname, stack size
; __stack, see data.c) and returns to the Shell at once.  This has to happen
; before the C startup code runs: both processes share the data and bss
; hunks, so the Shell copy must not run any C library init or exit code.
;
; The Makefile links this first, directly in front of vbcc's startup.o, so
; that the end of this CODE section is the start of the C startup code.

    include "dos/dosextens.i"
    include "dos/dostags.i"

_LVOFindTask        equ -294
_LVOOpenLibrary     equ -552
_LVOCloseLibrary    equ -414
_LVOCreateNewProc   equ -498

    xref    ___stack
    xref    ___procname

    section CODE,code

detach:
    movem.l d0-d7/a0-a6,-(sp)
    move.l  4.w,a6
    sub.l   a1,a1
    jsr     _LVOFindTask(a6)
    move.l  d0,a2
    move.l  pr_CLI(a2),d0
    beq.w   run                     ; started from Workbench
    lsl.l   #2,d0
    move.l  d0,a3                   ; struct CommandLineInterface *
    tst.l   cli_Module(a3)
    beq.w   run                     ; no seglist (resident): cannot detach

    ; The detached copy runs under the name __procname.  Its CLI may carry
    ; the seglist too, so the name is what tells the two copies apart.
    move.l  LN_NAME(a2),d0
    beq.s   notcopy
    move.l  d0,a0
    move.l  ___procname,a1
cmpname:
    move.b  (a0)+,d0
    cmp.b   (a1)+,d0
    bne.s   notcopy
    tst.b   d0
    bne.s   cmpname
    bra.w   run                     ; we are the detached copy
notcopy:

    lea     dosname(pc),a1
    moveq   #37,d0
    jsr     _LVOOpenLibrary(a6)
    tst.l   d0
    beq.s   run
    move.l  d0,a6

    clr.l   -(sp)                   ; TAG_DONE
    move.l  pr_Arguments(a2),-(sp)
    move.l  #NP_Arguments,-(sp)
    pea     -1.w
    move.l  #NP_Cli,-(sp)
    move.l  ___stack,-(sp)
    move.l  #NP_StackSize,-(sp)
    move.l  ___procname,-(sp)
    move.l  #NP_Name,-(sp)
    pea     -1.w
    move.l  #NP_FreeSeglist,-(sp)
    move.l  cli_Module(a3),-(sp)
    move.l  #NP_Seglist,-(sp)
    move.l  sp,d1
    jsr     _LVOCreateNewProc(a6)
    lea     13*4(sp),sp

    move.l  d0,d2
    beq.s   nodetach
    clr.l   cli_Module(a3)          ; the new process owns the seglist now
nodetach:
    move.l  a6,a1
    move.l  4.w,a6
    jsr     _LVOCloseLibrary(a6)
    tst.l   d2
    beq.w   run                     ; could not detach: just run here

    movem.l (sp)+,d0-d7/a0-a6
    moveq   #0,d0
    rts

dosname:
    dc.b    'dos.library',0
    even

run:
    movem.l (sp)+,d0-d7/a0-a6
end:
    ; vbcc's startup.o follows here

    ifne (end-detach)&3
    fail "detach.asm: code size must be a multiple of 4"
    endc
