#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/bzip2.html

source package_build.sh
TARBALL=bzip2-1.0.6.tar.gz
SRC_DIR=bzip2-1.0.6
BUILD_DIR=

prep_build "lfs"

make
make PREFIX=/tools install

cleanup_build
