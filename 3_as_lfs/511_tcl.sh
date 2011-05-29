#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/tcl.html

set -o nounset
set -o errexit

source shared.sh
match_user "lfs" || die 'This script must be run as the "lfs" user.'

cd $LFS/sources
tar -xf tcl8.5.9-src.tar.gz
cd tcl8.5.9

cd unix
./configure --prefix=/tools
make
#TZ=UTC make test || echo "Errors encountered, but this is okay."
make install
chmod -v u+w /tools/lib/libtcl8.5.so
make install-private-headers
ln -sv tclsh8.5 /tools/bin/tclsh

# Cleanup
cd $LFS/sources
rm -rf tcl8.5.9
