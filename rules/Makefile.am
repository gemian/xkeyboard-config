SUBDIRS = compat

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

if USE_COMPAT_RULES
base_parts = base.hdr.part  base.lists.part \
compat/base.lists.part \
base.m_k.part base.l1_k.part base.l_k.part  \
base.m_g.part base.mvl_s.part \
base.ml_s.part compat/base.ml_s.part \
base.ml1_s.part compat/base.ml1_s.part \
base.l2_s.part compat/base.l2_s.part \
base.l3_s.part compat/base.l3_s.part \
base.l4_s.part compat/base.l4_s.part \
base.m_s.part base.ml_c.part base.ml1_c.part \
base.m_t.part \
base.o_s.part base.o_c.part base.o_t.part
else
base_parts = base.hdr.part  base.lists.part \
base.m_k.part base.l1_k.part base.l_k.part  \
base.m_g.part base.mvl_s.part base.ml_s.part \
base.ml1_s.part \
base.l2_s.part base.l3_s.part base.l4_s.part \
base.m_s.part base.ml_c.part base.ml1_c.part \
base.m_t.part \
base.o_s.part base.o_c.part base.o_t.part
endif

rules_files = base sgi sun xfree98

lst_files = base.lst

%.lst: %.xml
	perl xml2lst.pl < $< > $@

base: $(base_parts)
	> $@
	for i in $^; do cat $$i >> $@; done

all_rules_files = $(rules_files) $(lst_files) \
xkb.dtd README

rules_DATA = $(all_rules_files)

xml_in_files = base.xml.in
xml_DATA = $(xml_in_files:.xml.in=.xml) 

EXTRA_DIST= $(all_rules_files) $(xml_in_files) $(base_parts) xml2lst.pl

rulesdir = $(xkb_base)/rules
xmldir = $(rulesdir)

@INTLTOOL_XML_RULE@
