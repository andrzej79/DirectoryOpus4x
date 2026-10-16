#ifndef DOPUS_COMPILER_H
#define DOPUS_COMPILER_H
/*
 * Directory Opus 4: compiler abstraction.
 *
 * REG(reg, decl) declares a function argument passed in a 68k register:
 *
 *     void foo(REG(a0, char *buf), REG(d0, int len));
 *
 * __saveds and __chip are understood by vbcc, SAS/C and GCC (amigaos) alike.
 */

#if defined(__VBCC__)
#define REG(r, a) __reg(#r) a
#elif defined(__GNUC__)
#define REG(r, a) register a __asm(#r)
#elif defined(__SASC)
#define REG(r, a) register __##r a
#else
#error "Unsupported compiler"
#endif

/* libnix' _exit(): leave without running the C library's exit handlers */
#if defined(__VBCC__)
#define _exit(c) _Exit(c)
#endif

/*
 * D_S(type,name) declares a longword aligned struct on the stack, for
 * structures DOS reaches through a BPTR (FileInfoBlock, InfoData).  It is
 * the portable form of SAS/C's "__aligned"; name is a pointer to the struct.
 */
#define D_S(type, name)                                                                                                \
  char a_##name[sizeof(type) + 3];                                                                                     \
  type *name = (type *)(((LONG)(a_##name + 3)) & ~3)

/*
 * The DOpus sources were written against the NDK's "#define NULL 0L" and use
 * NULL for integer fields too (Gadget IDs, IDCMP flags, ...).  vbcc's C
 * library headers make it ((void *)0), which is an error there, so put back
 * the NDK definition.  Include this after the C library headers.
 */
#undef NULL
#define NULL 0L

#endif /* DOPUS_COMPILER_H */
