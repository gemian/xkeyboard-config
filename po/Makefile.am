EXTRA_DIST = $(wildcard *.po)

update-pot:
	$(INTLTOOL_UPDATE) -p -g $(GETTEXT_PACKAGE)

update-po:
	for i in *.po; do echo Updating $$i; $(INTLTOOL_UPDATE) `basename $$i .po` -g $(GETTEXT_PACKAGE); done
