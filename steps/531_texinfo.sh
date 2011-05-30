#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/texinfo.html

source package_build.sh
TARBALL=texinfo-4.13a.tar.gz
SRC_DIR=texinfo-4.13
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
