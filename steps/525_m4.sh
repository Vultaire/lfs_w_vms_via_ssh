#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/m4.html

source package_build.sh
TARBALL=m4-1.4.15.tar.bz2
SRC_DIR=m4-1.4.15
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
