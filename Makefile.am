SUBDIRS = intl m4  po 

xml_in_files = xfree86.xml.in
xml_DATA = $(xml_in_files:.xml.in=.xml) xkb.dtd

@INTLTOOL_XML_RULE@

EXTRA_DIST= config.rpath mkinstalldirs  config.rpath $(xml_in_files) $(xml_DATA) \
       autogen.sh \
       xfree86_xkb_xml.spec \
       xfree86_xkb_xml.spec.in \
       intltool-extract.in intltool-merge.in intltool-update.in

xmldir = $(xkb_base)/rules

ACLOCAL_AMFLAGS = -I m4
