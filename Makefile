################################################################################
#
#	21 May, 2022 - E M Thornber
#	Created
#
#	25 May, 2022 - E M THornber
#   Update package names
################################################################################

EPM=/usr/local/bin/epm
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
	$(EPM) -vv srcdir="./" $(PKGNAME) ./$(PKGDEFN) | tee portable-$(TS).log

deb:
	$(EPM) -vv -f deb srcdir="./" $(PKGNAME) ./$(PKGDEFN) | tee deb-$(TS).log
