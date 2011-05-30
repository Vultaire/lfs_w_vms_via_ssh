#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/diffutils.html

source package_build.sh
TARBALL=diffutils-3.0.tar.gz
SRC_DIR=diffutils-3.0
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
