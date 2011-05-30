#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/tcl.html

source package_build.sh
TARBALL=tcl8.5.9-src.tar.gz
SRC_DIR=tcl8.5.9
BUILD_DIR=

prep_build "lfs"

cd unix
./configure --prefix=/tools
make
#TZ=UTC make test || echo "Errors encountered, but this is okay."
make install
chmod -v u+w /tools/lib/libtcl8.5.so
make install-private-headers
ln -sv tclsh8.5 /tools/bin/tclsh

cleanup_build
