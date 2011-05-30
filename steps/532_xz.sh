#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/xz-utils.html

source package_build.sh
TARBALL=xz-5.0.1.tar.bz2
SRC_DIR=xz-5.0.1
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
