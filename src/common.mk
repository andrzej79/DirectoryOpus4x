# Shared toolchain settings, included by every component Makefile in src/.
# A component sets TARGET (and optionally EXTRA_INC, DEFINES, ...) first.

.DEFAULT_GOAL := all

# ---- Paths ----
ROOT_DIR    := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))..)
COMP        := $(notdir $(CURDIR))
BUILD_DIR   := $(ROOT_DIR)/build/$(COMP)

# ---- SDK / Includes ----
SDK_DIR     := /opt/amiga_sdk
NDK_INC_C   := $(SDK_DIR)/NDK3.2R4/Include_H
NDK_INC_ASM := $(SDK_DIR)/NDK3.2R4/Include_I
DOPUS_INC   := $(ROOT_DIR)/src/include
SDK3_INC    := $(ROOT_DIR)/sdk/include
INC_DIRS    := . $(EXTRA_INC) $(DOPUS_INC) $(SDK3_INC)
INC_FLAGS   := $(addprefix -I,$(INC_DIRS)) -I$(NDK_INC_C)

# ---- Defines ----
DEF_FLAGS   := $(addprefix -D,$(DEFINES))

# ---- Toolchain ----
CC      := vc
AS      := vasmm68k_mot
RM      := rm -rf
MKDIR   := mkdir -p

# ---- Flags ----
# 68020, no FPU instructions: vbcc's soft-float (msoft.lib) maths
CFLAGS  := +aos68k_std -cpu=68020 -c99 -O2 -rmcfg-amiga-softfloat $(EXTRA_CFLAGS)
AFLAGS  := -quiet -Fhunk -m68020 -nowarn=62 -I$(NDK_INC_ASM) $(EXTRA_AFLAGS)
LIBS    := -lauto -lamiga -ldebug -lmsoft

# ---- Sources / Objects ----
SRCS_C  ?= $(wildcard *.c)
SRCS_S  ?= $(wildcard *.asm) $(wildcard *.a)
OBJS    := $(patsubst %.c,$(BUILD_DIR)/%.o,$(SRCS_C)) \
           $(patsubst %,$(BUILD_DIR)/%.o,$(basename $(SRCS_S)))

# No dependency files from vbcc: rebuild everything when a header changes
HDRS    := $(wildcard *.h) $(shell find $(DOPUS_INC) -name '*.h')
$(OBJS): $(HDRS)

# Third-party headers come from tools/fetch_sdk.sh
$(SDK3_INC):
	@echo "sdk/include is missing - run tools/fetch_sdk.sh first" && exit 1

# Compile/Assemble
$(BUILD_DIR)/%.o: %.c | $(SDK3_INC)
	@$(MKDIR) $(@D)
	$(CC) $(CFLAGS) $(INC_FLAGS) $(DEF_FLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.asm
	@$(MKDIR) $(@D)
	$(AS) $(AFLAGS) $< -o $@

$(BUILD_DIR)/%.o: %.a
	@$(MKDIR) $(@D)
	$(AS) $(AFLAGS) $< -o $@
