#!/bin/sh

ROOT="`dirname $0`/.."
F1=reg2ll.lst
F2=gn2ll.lst

xsltproc $ROOT/xslt/reg2ll.xsl $ROOT/rules/base.xml | sort | uniq > $F1

for i in $ROOT/symbols/*; do
  if [ -f $i ]; then
    id="`basename $i`"
    gawk 'BEGIN{FS="\""}/^[[:space:]]*name\[Group1\][[:space:]]*=/{print $2;}' $i | while read name; do
      echo "$id:\"$name\""
    done
  fi
done | sort | uniq > $F2

diff $F1 $F2
