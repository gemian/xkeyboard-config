if CREATE_RULES_SYMLINK
  extra_rules_file = $(xkb_rules_symlink)
  extra_dir_file   = $(extra_rules_file).xml 
  extra_lst_file   = $(extra_rules_file).lst

install-data-hook:
	ln -sf base     $(DESTDIR)$(rulesdir)/$(extra_rules_file)
	ln -sf base.lst $(DESTDIR)$(rulesdir)/$(extra_lst_file)
	ln -sf base.xml $(DESTDIR)$(rulesdir)/$(extra_dir_file)

else
install-data-hook:

endif


rules_files = base sgi sun xfree98

lst_files = base.lst

%.lst: %.xml
	perl xml2lst.pl < $< > $@

all_rules_files = $(rules_files) $(lst_files) \
xkb.dtd README

rules_DATA = $(all_rules_files)

xml_in_files = base.xml.in
xml_DATA = $(xml_in_files:.xml.in=.xml) 

EXTRA_DIST= $(all_rules_files) $(xml_in_files) xml2lst.pl compat

rulesdir = $(xkb_base)/rules
xmldir = $(rulesdir)

@INTLTOOL_XML_RULE@
