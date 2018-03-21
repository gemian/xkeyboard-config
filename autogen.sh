#! /bin/sh

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

ORIGDIR=`pwd`
cd $srcdir

autopoint --force
AUTOPOINT='intltoolize --automake --copy --force' autoreconf -v --install --force || exit 1

cd $ORIGDIR || exit $?
$srcdir/configure "$@"
