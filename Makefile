# Directory Opus 4 - top level build
#
#   make            build all components, then assemble build/DirectoryOpus4x
#   make clean      remove build/
#   make install    copy build/DirectoryOpus4x to $(TARGET_DIR)
#   make ftp        build, then upload build/DirectoryOpus4x to the Amiga
#   make catalogs   check the catalog descriptions, compile the translations
#   make lha        build, then pack the drawer and its icon into release/DOpus4x.lha,
#                   with release/DOpus4x.readme for Aminet
#   make protos     regenerate the vbcc inline headers of src/include
#
# Each component can also be built alone: make -C src/Program

COMPONENTS  := Library Program Config DOpus_Disk DOpus_Icon DOpus_Print DOpusRT

BUILD_DIR   := build
DIST_DIR    := $(BUILD_DIR)/DirectoryOpus4x
TARGET_DIR  ?= ~/Documents/Amiga/amiga_uae_disk/
FTP_DIR     ?= Work:DirOpus4x/
RELEASE_DIR := release
LHA_FILE    := $(RELEASE_DIR)/DOpus4x.lha
README_FILE := $(RELEASE_DIR)/DOpus4x.readme
# Version for the Aminet readme, from the $$VER string of the program
VERSION     := $(shell sed -n 's/.*\$$VER: Directory Opus \([0-9.]*\).*/\1/p' src/Program/about.c)
# Uploader e-mail for the Aminet readme: UPLOADER=... in aminet.local (git-ignored)
-include aminet.local

INC         := src/include

.PHONY: all $(COMPONENTS) catalogs dist clean install ftp lha protos

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
	cp icons/DirectoryOpus.info $(DIST_DIR)/
	cp icons/drawer.info $(BUILD_DIR)/DirectoryOpus4x.info
	python3 tools/amiSnapRemove.py --no-backup $(DIST_DIR)/DirectoryOpus.info $(BUILD_DIR)/DirectoryOpus4x.info >/dev/null
	cp ChangeLog $(DIST_DIR)/
	cp LICENSE $(DIST_DIR)/COPYING
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

# Aminet release: the dist tree as DirectoryOpus4x/ with its drawer icon, file
# names in ISO-8859-1 as the Amiga spells them (Catalogs/español), and the
# readme: aminet/DOpus4x.readme followed by the ChangeLog, also put into the
# drawer.  Both are checked against the Aminet rules.  Replaces an existing archive.
lha: dist
	@echo '------  LHA  ------'
	@test -n "$(UPLOADER)" || { echo 'make lha: set UPLOADER=<e-mail> in aminet.local'; exit 1; }
	@test -n "$(VERSION)" || { echo 'make lha: no version in src/Program/about.c'; exit 1; }
	@mkdir -p $(RELEASE_DIR)
	$(RM) $(LHA_FILE) $(README_FILE)
	{ sed -e 's/@VERSION@/$(VERSION)/' -e 's/@UPLOADER@/$(UPLOADER)/' aminet/DOpus4x.readme; \
	  echo; echo; cat ChangeLog; } >$(README_FILE)
	cp $(README_FILE) $(DIST_DIR)/
	cd $(BUILD_DIR) && lha aq2o5 --ignore-mac-files --system-kanji-code=utf8 --archive-kanji-code=latin1 \
	    $(abspath $(LHA_FILE)) DirectoryOpus4x DirectoryOpus4x.info
	lha t $(LHA_FILE) >/dev/null
	python3 tools/aminet_check.py $(LHA_FILE) $(README_FILE)
	lha l $(LHA_FILE) | tail -1

# dopus.library's own inline headers, from its FD file and prototypes
protos:
	python3 tools/fd2vbcc.py $(INC)/fd/dopus_lib.fd $(INC)/clib/dopus_protos.h $(INC)/inline/dopus_protos.h
	python3 tools/fd2vbcc.py $(INC)/fd/accounts_lib.fd $(INC)/clib/accounts_protos.h $(INC)/inline/accounts_protos.h
	python3 tools/fd2vbcc.py $(INC)/fd/inovamusic_lib.fd $(INC)/clib/inovamusic_protos.h $(INC)/inline/inovamusic_protos.h
	python3 tools/fd2vbcc.py $(INC)/fd/sysinfo_lib.fd $(INC)/clib/sysinfo_protos.h $(INC)/inline/sysinfo_protos.h \
	    --proto $(INC)/proto/sysinfo.h
