#!/bin/sh


OUTFILE=base.l4_s.part

> $OUTFILE

awk '{ 
  printf "  %s		=	%s%%(v[4]):4\n", $1, $2; 
}' < layoutRename.lst >> $OUTFILE
