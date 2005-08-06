AUTOMAKE_OPTIONS = foreign

SUBDIRS = compat geometry keycodes keymap po rules semantics symbols types docs

EXTRA_DIST=config.rpath COPYING CREDITS README \
       autogen.sh \
       xkeyboard-config.spec \
       xkeyboard-config.spec.in \
       intltool-extract.in intltool-merge.in intltool-update.in

DISTCLEANFILES=intltool-extract intltool-merge intltool-update

dnl ACLOCAL_AMFLAGS = -I m4

if CREATE_XKBCOMP_SYMLINK
install-data-hook:
	ln -sf ../../../bin/xkbcomp $(DESTDIR)$(xkb_base)/xkbcomp
	rm -f $(DESTDIR)$(xkb_base)/compiled
	ln -sf /var/lib/xkb $(DESTDIR)$(xkb_base)/compiled
else
install-data-hook:
	rm -f $(DESTDIR)$(xkb_base)/compiled
	ln -sf /var/lib/xkb $(DESTDIR)$(xkb_base)/compiled

endif
