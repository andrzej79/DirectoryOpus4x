# Directory Opus 4 - top level build
#
#   make            build all components, then assemble build/DirectoryOpus4x
#   make clean      remove build/
#   make install    copy build/DirectoryOpus4x to $(TARGET_DIR)
#   make ftp        build, then upload build/DirectoryOpus4x to the Amiga
#   make catalogs   check the catalog descriptions, compile the translations
#   make protos     regenerate the vbcc inline headers of src/include
#
# Each component can also be built alone: make -C src/Program

COMPONENTS  := Library Program Config DOpus_Disk DOpus_Icon DOpus_Print DOpusRT

BUILD_DIR   := build
DIST_DIR    := $(BUILD_DIR)/DirectoryOpus4x
TARGET_DIR  ?= ~/Documents/Amiga/amiga_uae_disk/
FTP_DIR     ?= Work:DirOpus4x/

INC         := src/include

.PHONY: all $(COMPONENTS) catalogs dist clean install ftp protos

all: dist

$(COMPONENTS):
	$(MAKE) -C src/$@

# Locale catalogs.  The program asks for strings by their enum value, so each
# .cd must list the enum of its component in order (checked, with the English
# texts against default_strings[]).  Translations go to Catalogs/<language>/,
# where locale.library looks first (PROGDIR:Catalogs/, then LOCALE:Catalogs/).
# The translated help (DO_/CO_<language>.HLP, next to the .ct files) goes to S/.
CAT_SRC     := src/catalogs

catalogs:
	@echo '------ CATALOGS ------'
	python3 tools/catcomp.py check $(CAT_SRC)/DOpus4.cd src/Program/dopusstrings.h src/Program/strings.c
	python3 tools/catcomp.py check $(CAT_SRC)/DOpus4_Config.cd src/Config/configstrings.h src/Config/strings.c
	python3 tools/catcomp.py check $(CAT_SRC)/DOpus4_Disk.cd src/DOpus_Disk/diskstrings.h src/DOpus_Disk/strings.c
	python3 tools/catcomp.py check $(CAT_SRC)/DOpus4_Icon.cd src/DOpus_Icon/iconstrings.h src/DOpus_Icon/strings.c
	python3 tools/catcomp.py check $(CAT_SRC)/DOpus4_Print.cd src/DOpus_Print/printstrings.h src/DOpus_Print/strings.c
	python3 tools/catcomp.py build $(CAT_SRC) $(DIST_DIR)/Catalogs

# Distribution tree, laid out the way DOpus looks for its files
# (PROGDIR:C/, Libs/, Modules/, S/ - see look_dirs[] in Library/dopus_stuff.c)
dist: $(COMPONENTS) catalogs
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
	cp src/catalogs/*/*.HLP $(DIST_DIR)/S/

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
