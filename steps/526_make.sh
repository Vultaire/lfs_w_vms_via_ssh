#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/make.html

source package_build.sh
TARBALL=make-3.82.tar.bz2
SRC_DIR=make-3.82
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
