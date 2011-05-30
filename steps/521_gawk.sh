#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/gawk.html

source package_build.sh
TARBALL=gawk-3.1.8.tar.bz2
SRC_DIR=gawk-3.1.8
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
