#!/bin/sh


OUTFILE=base.l3_s.part

> $OUTFILE

awk '{ 
  printf " %s   = %s%%(v[3]):3\n", $1, $2; 
}' < layoutRename.lst >> $OUTFILE
