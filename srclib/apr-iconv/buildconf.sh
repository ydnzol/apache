#!/bin/sh

#
# Build aclocal.m4 from libtool's libtool.m4 and our own M4 files.
#
libtoolize=`../apr/build/PrintPath glibtoolize libtoolize`
if [ "x$libtoolize" = "x" ]; then
    echo "libtoolize not found in path"
    exit 1
fi
ltpath=`dirname $libtoolize`
ltfile=`cd $ltpath/../share/aclocal ; pwd`/libtool.m4
echo "Incorporating $ltfile into aclocal.m4 ..."
echo "dnl THIS FILE IS AUTOMATICALLY GENERATED BY buildconf.sh" > aclocal.m4
echo "dnl edits here will be lost" >> aclocal.m4
cat build/apr-iconv.m4 >> aclocal.m4
cat $ltfile >> aclocal.m4

#
# Create the libtool helper files
#
# Note: we always replace the files, and we copy (rather than link) them.
#
echo "Copying libtool helper files ..."
$libtoolize --force --copy

#
# Generate the autoconf header (include/apu_config.h) and ./configure
#
echo "Creating include/private/apu_config.h ..."
autoheader

echo "Creating configure ..."
### do some work to toss config.cache?
autoconf