#!/bin/sh

variant=$1

OUTFILE=base.l${variant}_s.part

> $OUTFILE

awk '{ 
  printf "  %s		=	+%s%%(v['${variant}']):'${variant}'\n", $1, $2; 
}' < layoutRename.lst >> $OUTFILE
