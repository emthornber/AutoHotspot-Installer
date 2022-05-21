################################################################################
#
#	21 May, 2022 - E M Thornber
#	Created
#
################################################################################

EPM=/usr/local/bin/epm
PKGNAME=ESL-MERG-autohs
RM=/usr/bin/rm -f
TS=`date "+%y%m%d-%H%M"`
CFG_BASE=./Autohotspot/config

all: clean pkgs

clean:
	$(RM) *.log

pkgs: portable deb

portable:
	$(EPM) -vv $(PKGNAME) ./$(PKGNAME).epm | tee portable-$(TS).log

deb:
	$(EPM) -vv -f deb $(PKGNAME) ./$(PKGNAME).epm | tee deb-$(TS).log
