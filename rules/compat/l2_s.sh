#!/bin/sh


OUTFILE=base.l2_s.part

> $OUTFILE

awk '{ 
  printf " %s   = %s%%(v[2]):2\n", $1, $2; 
}' < layoutRename.lst >> $OUTFILE
