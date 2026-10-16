# Directory Opus 4 - top level build
#
#   make            build all components, then assemble build/DirectoryOpus4x
#   make clean      remove build/
#   make install    copy build/DirectoryOpus4x to $(TARGET_DIR)
#   make ftp        build, then upload build/DirectoryOpus4x to the Amiga
#   make protos     regenerate the vbcc inline headers of src/include
#
# Each component can also be built alone: make -C src/Program

COMPONENTS  := Library Program Config DOpus_Disk DOpus_Icon DOpus_Print DOpusRT

BUILD_DIR   := build
DIST_DIR    := $(BUILD_DIR)/DirectoryOpus4x
TARGET_DIR  ?= ~/Documents/Amiga/amiga_uae_disk/
FTP_DIR     ?= Work:DirOpus4x/

INC         := src/include

.PHONY: all $(COMPONENTS) dist clean install ftp protos

all: dist

$(COMPONENTS):
	$(MAKE) -C src/$@

# Distribution tree, laid out the way DOpus looks for its files
# (PROGDIR:C/, Libs/, Modules/, S/ - see look_dirs[] in Library/dopus_stuff.c)
dist: $(COMPONENTS)
	@echo '------  DIST  ------'
	@mkdir -p $(DIST_DIR)/C $(DIST_DIR)/Libs $(DIST_DIR)/Modules $(DIST_DIR)/S
	cp $(BUILD_DIR)/Program/DirectoryOpus $(DIST_DIR)/
	cp $(BUILD_DIR)/DOpusRT/DOpusRT $(DIST_DIR)/C/
	cp $(BUILD_DIR)/Library/dopus.library $(DIST_DIR)/Libs/
	cp $(BUILD_DIR)/Config/ConfigOpus $(BUILD_DIR)/DOpus_Disk/DOpus_Disk \
	   $(BUILD_DIR)/DOpus_Icon/DOpus_Icon $(BUILD_DIR)/DOpus_Print/DOpus_Print \
	   $(DIST_DIR)/Modules/
	cp src/Program/DirectoryOpus.hlp $(DIST_DIR)/S/DirectoryOpus.HLP
	cp src/Config/ConfigOpus.HLP $(DIST_DIR)/S/ConfigOpus.HLP

clean:
	$(RM) -r $(BUILD_DIR)

install: dist
	@echo '------ INSTALL ------'
	mkdir -p $(TARGET_DIR)/DirectoryOpus4x
	cp -R $(DIST_DIR)/ $(TARGET_DIR)/DirectoryOpus4x/

# Upload to a live Amiga.  The FTP login comes from ftp.local (git-ignored,
# see ftp.local.example) or the AMIGA_FTP_* environment variables.
ftp: dist
	python3 tools/ftpput.py $(DIST_DIR) -d $(FTP_DIR)

# dopus.library's own inline headers, from its FD file and prototypes
protos:
	python3 tools/fd2vbcc.py $(INC)/fd/dopus_lib.fd $(INC)/clib/dopus_protos.h $(INC)/inline/dopus_protos.h
	python3 tools/fd2vbcc.py $(INC)/fd/accounts_lib.fd $(INC)/clib/accounts_protos.h $(INC)/inline/accounts_protos.h
	python3 tools/fd2vbcc.py $(INC)/fd/inovamusic_lib.fd $(INC)/clib/inovamusic_protos.h $(INC)/inline/inovamusic_protos.h
	python3 tools/fd2vbcc.py $(INC)/fd/sysinfo_lib.fd $(INC)/clib/sysinfo_protos.h $(INC)/inline/sysinfo_protos.h \
	    --proto $(INC)/proto/sysinfo.h
