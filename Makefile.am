SUBDIRS = compat compiled geometry intl keycodes keymap m4 po rules semantics symbols types docs

EXTRA_DIST= COPYING README config.rpath mkinstalldirs  config.rpath \
       autogen.sh \
       xkeyboard-config.spec \
       xkeyboard-config.spec.in \
       intltool-extract.in intltool-merge.in intltool-update.in

ACLOCAL_AMFLAGS = -I m4

if CREATE_XKBCOMP_SYMLINK
install-data-hook:
	ln -sf ../../../bin/xkbcomp $(DESTDIR)$(xkb_base)/xkbcomp

else
install-data-hook:

endif
