
transform_files=layoutRename.lst

transform_scripts=l2_s.sh l3_s.sh l4_s.sh ml1_s.sh ml_s.sh


if USE_COMPAT_RULES

noinst_SCRIPTS=base.l2_s.part base.l3_s.part base.l4_s.part \
base.ml1_s.part base.ml_s.part

else

noinst_SCRIPTS=

endif

base.l2_s.part: l2_s.sh
	sh $<

base.l3_s.part: l3_s.sh
	sh $<

base.l4_s.part: l4_s.sh
	sh $<

base.ml1_s.part: ml1_s.sh
	sh $<

base.ml_s.part: ml_s.sh
	sh $<

EXTRA_DIST=base.lists.part $(transform_files) $(transform_scripts)
