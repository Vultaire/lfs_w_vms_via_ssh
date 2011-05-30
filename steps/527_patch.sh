#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/patch.html

source package_build.sh
TARBALL=patch-2.6.1.tar.bz2
SRC_DIR=patch-2.6.1
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
