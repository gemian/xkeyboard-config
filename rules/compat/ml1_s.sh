#!/bin/sh

OUTFILE=base.ml1_s.part

> $OUTFILE

awk '{ 
  printf "  $pcmodels	%s			=	pc(%m)+%s%%(v[1])\n", $1, $2; 
  printf "  *		%s			=	pc(pc105)+%s%%(v[1])\n", $1, $2; 
}' < layoutRename.lst >> $OUTFILE
