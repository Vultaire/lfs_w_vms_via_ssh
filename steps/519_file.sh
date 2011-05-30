#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/file.html

source package_build.sh
TARBALL=file-5.05.tar.gz
SRC_DIR=file-5.05
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
