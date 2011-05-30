#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/sed.html

source package_build.sh
TARBALL=sed-4.2.1.tar.bz2
SRC_DIR=sed-4.2.1
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
