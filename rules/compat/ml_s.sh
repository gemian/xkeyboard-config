#!/bin/sh

OUTFILE=base.ml_s.part

> $OUTFILE

awk '{ 
  printf " $pcmodels    %s   = pc(%m)+%s\n", $1, $2; 
  printf " *            %s   = pc(pc105)+%s\n", $1, $2; 
}' < layoutRename.lst >> $OUTFILE
