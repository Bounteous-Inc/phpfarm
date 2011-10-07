#!/bin/bash
# You can override config options very easily.
# Just create a custom options file in the custom/ directory.
# It may be version specific:
# - custom/options.sh
# - custom/options-5.sh
# - custom/options-5.3.sh
# - custom/options-5.3.1.sh
#
# Don't touch this file here - it would prevent you to just "svn up"
# your phpfarm source code.

version=$1
vmajor=$2
vminor=$3
vpatch=$4

#gcov='--enable-gcov'
configoptions="\
--enable-bcmath \
--enable-calendar \
--enable-exif \
--enable-ftp \
--enable-mbstring \
--enable-pcntl \
--enable-soap \
--enable-sockets \
--enable-sqlite-utf8 \
--enable-wddx \
--enable-zip \
--with-zlib \
--with-gettext \
$gcov"

echo $version $vmajor $vminor $vpatch

for suffix in "" "-$vmajor" "-$vmajor.$vminor" "-$vmajor.$vminor.$vpatch"; do
    custom="custom/options$suffix.sh"
    [ -f $custom -o -L $custom ] && source "$custom" $version $vmajor $vminor $vpatch
done
