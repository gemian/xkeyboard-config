#!/bin/bash

DEST=$1
shift

lineNo=0

> $DEST

for i in $*; do
  if [ "$i" == "HDR" ] ; then
    echo >> $DEST;
    lineNo=$((lineNo + 1))
    head -$lineNo HDR | tail -1 >> $DEST
  else
    cat $i >> $DEST;
  fi
done

