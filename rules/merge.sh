#!/bin/sh

DEST=$1
shift

> $DEST

for i in $*; do
  if [ "$i" == "HDR" ] ; then
    echo >> $DEST;
    read hdr
    echo "$hdr" >> $DEST
  else
    cat $i >> $DEST;
  fi
done < HDR

