#!/bin/sh

OUTFILE=base.ml_s.part

> $OUTFILE

awk '{ 
  printf "  $pcmodels	%s			=	pc(%%m)+%s\n", $1, $2; 
  printf "  *		%s			=	pc(pc105)+%s\n", $1, $2; 
}' < layoutRename.lst >> $OUTFILE

awk '{ 
  printf "  $pcmodels	%s(%s)			=	pc(%%m)+%s(%s)\n", $1, $2, $3, $4; 
  printf "  *		%s(%s)			=	pc(pc105)+%s(%s)\n", $1, $2, $3, $4; 
}' < variantRename.lst >> $OUTFILE
