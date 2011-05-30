#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/findutils.html

source package_build.sh
TARBALL=findutils-4.4.2.tar.gz
SRC_DIR=findutils-4.4.2
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
