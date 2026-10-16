# ---- Project ----
TARGET      := dopus.library

# dopuslib.a (romtag, jump table, init) must be the first object linked
SRCS_S      := dopuslib.a data.a functions.a functions2.a graphics.a

include ../common.mk

# romtag first: a library run as a program must just return
OBJS        := $(BUILD_DIR)/dopuslib.o $(filter-out $(BUILD_DIR)/dopuslib.o,$(OBJS))

LIBDIR      := $(SDK_DIR)/vbcc/targets/m68k-amigaos/lib
LDFLAGS     := -bamigahunk -x -Bstatic -Cvbcc -nostdlib -s -sc

.PHONY: all clean

all: $(BUILD_DIR)/$(TARGET)

# Link: no startup code, the library's own entry is in dopuslib.a
$(BUILD_DIR)/$(TARGET): $(OBJS)
	@echo '------  LINK  ------'
	vlink $(LDFLAGS) $(OBJS) -L$(LIBDIR) -lvc -lamiga -ldebug -lmsoft -o $@

clean:
	$(RM) $(BUILD_DIR)
