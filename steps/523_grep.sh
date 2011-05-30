#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/grep.html

source package_build.sh
TARBALL=grep-2.7.tar.gz
SRC_DIR=grep-2.7
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools --disable-perl-regexp
make
#make check
make install

cleanup_build
