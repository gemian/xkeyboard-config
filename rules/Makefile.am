rules_DATA = \
base base-it.lst base.lst \
sgi sgi.lst \
sun sun.lst \
xfree98 xfree98.lst \
xkb.dtd README

xml_in_files = base.xml.in
xml_DATA = $(xml_in_files:.xml.in=.xml)

EXTRA_DIST= $(rules_DATA) $(xml_in_files) xml2lst.pl

rulesdir = $(xkb_base)/rules
xmldir = $(rulesdir)

@INTLTOOL_XML_RULE@
