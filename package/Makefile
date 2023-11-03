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
#	EVs required
#	ODIR - where to place the .deb file
#	SDIR - current source directory
#
#	Working directory is assumed to be ${CMAKE_CURRENT_SOURCE_DIR}
################################################################################

EPM=/usr/bin/epm
#EPM=/usr/local/bin/epm
PKGNAME=autohs
PKGDEFN=AutoHotspot.epm
RM=/usr/bin/rm -f
TS=`date "+%y%m%d-%H%M"`
CFG_BASE=./Autohotspot/config

all: clean pkgs

clean:
	$(RM) *.log

pkgs: portable deb

portable:
	$(EPM) -a all -f portable -vv --output-dir $(ODIR) srcdir=$(SDIR) $(PKGNAME) $(SDIR)/package/$(PKGDEFN) | tee portable-$(TS).log

deb:
	$(EPM) -a all -f deb      -vv --output-dir $(ODIR) srcdir=$(SDIR) $(PKGNAME) $(SDIR)/package/$(PKGDEFN) | tee deb-$(TS).log
