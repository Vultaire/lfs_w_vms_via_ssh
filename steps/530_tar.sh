#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/tar.html

source package_build.sh
TARBALL=tar-1.25.tar.bz2
SRC_DIR=tar-1.25
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
