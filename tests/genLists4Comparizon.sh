#!/bin/sh

ROOT="`dirname $0`/.."
F1=reg2ll.lst
F2=gn2ll.lst

xsltproc $ROOT/xslt/reg2ll.xsl $ROOT/rules/base.xml | sort | uniq > $F1

for i in $ROOT/symbols/*; do
  if [ -f $i ]; then
    id="`basename $i`"
    gawk 'BEGIN{
  FS="\""
  isDefault=0;
}
/.*default.*/{
  isDefault=1;
}
/xkb_symbols/{
  variant=$2;
}/^[[:space:]]*name\[Group1\][[:space:]]*=/{
  if (isDefault==1)
  {
    printf "___ %s\n",$2;
    isDefault=0;
  } else
  {
    printf "%s %s\n",variant,$2;
  }
}' $i | while read var name; do
      # read one variable!
      if [ "${var}" == "___" ]; then
        echo "${id}:\"${name}\""
      else
        echo "${id}(${var}):\"${name}\""
      fi
    done
  fi
done | sort | uniq > $F2

diff $F1 $F2
