################################################################################
#
#	21 May, 2022 - E M Thornber
#	Created
#
#	25 May, 2022 - E M THornber
#	Update package names
#
#	3 November, 2023 - E M Thornber
#	Integrate into CMake
#
#	4 December, 2023 - E M Thornber
#	Add creation of autohotspot-direct.conf
#
#	EVs required
#	ODIR - where to place the .deb file
#	SDIR - current source directory
#	VERS - package version
#
#	Working directory is assumed to be ${CMAKE_CURRENT_SOURCE_DIR}
################################################################################

EPM=/usr/bin/epm
PKGNAME=autohs
PKGDEFN=AutoHotspot.epm
PYTHON=/usr/bin/python3
RM=/usr/bin/rm -f
TS=`date "+%y%m%d-%H%M"`
SRC_BASE=AutoHotspot-Setup/Autohotspot
CFG_BASE=$(SRC_BASE)/config

all: clean pkgs

clean:
	$(RM) *.log

pkgs: portable deb

portable: $(CFG_BASE)/autohotspot-direct.conf
	$(EPM) -a all -f portable -g -vv --output-dir $(ODIR) srcdir=$(SDIR) pkgver=$(VERS) $(PKGNAME) $(SDIR)/package/$(PKGDEFN) 2>&1 | tee portable-$(TS).log

deb: $(CFG_BASE)/autohotspot-direct.conf
	$(EPM) -a all -f deb      -g -vv --output-dir $(ODIR) srcdir=$(SDIR) pkgver=$(VERS) $(PKGNAME) $(SDIR)/package/$(PKGDEFN) 2>&1 | tee deb-$(TS).log

$(CFG_BASE)/autohotspot-direct.conf: $(CFG_BASE)/autohotspot-direct-conf-defn.json
	$(PYTHON) $(SRC_BASE)/create-autohotspot-direct-conf.py < $< > $@
