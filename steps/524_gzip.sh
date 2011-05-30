#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/gzip.html

source package_build.sh
TARBALL=gzip-1.4.tar.gz
SRC_DIR=gzip-1.4
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools
make
#make check
make install

cleanup_build
