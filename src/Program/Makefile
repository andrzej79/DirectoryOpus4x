# ---- Project ----
TARGET      := DirectoryOpus

DEFINES     := WITHPCHG

# Link libraries built from source along with the program:
#  ../pchg      - PCHG (palette change) IFF support
#  sdk/stubs    - varargs stubs for popupmenu.library (from tools/fetch_sdk.sh)
STUBS_DIR   := ../../sdk/stubs
VPATH       := ../pchg $(STUBS_DIR)

# assembly.c is an unfinished C port of assembly.asm (the original makefile
# built the .asm); getusage.c replaced getusage.asm
SRCS_C      := $(filter-out assembly.c,$(wildcard *.c)) \
               $(notdir $(wildcard ../pchg/*.c)) \
               $(notdir $(wildcard $(STUBS_DIR)/*.c))
SRCS_S      := assembly.asm chipimage.asm BuildFreqTable.a FastDecomp.a

EXTRA_AFLAGS := -D_PHXASS_

include ../common.mk

LIBDIR      := $(SDK_DIR)/vbcc/targets/m68k-amigaos/lib
# vc's own link line (+aos68k_std), with detach.o in front of startup.o
LDFLAGS     := -bamigahunk -x -Bstatic -Cvbcc -nostdlib -mrel -s -Rstd

# assembly.o comes from assembly.asm, not from the pattern rule for assembly.c
$(BUILD_DIR)/assembly.o: assembly.asm
	@$(MKDIR) $(@D)
	$(AS) $(AFLAGS) $< -o $@

.PHONY: all clean

all: $(BUILD_DIR)/$(TARGET)

# Link: detach.o first, it falls through into vbcc's startup code
$(BUILD_DIR)/$(TARGET): $(BUILD_DIR)/detach.o $(OBJS)
	@echo '------  LINK  ------'
	vlink $(LDFLAGS) $(BUILD_DIR)/detach.o $(LIBDIR)/startup.o $(OBJS) \
	    -L$(LIBDIR) $(LIBS) -lvc -o $@

clean:
	$(RM) $(BUILD_DIR)
