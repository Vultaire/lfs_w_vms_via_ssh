#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/dejagnu.html

source package_build.sh
TARBALL=dejagnu-1.4.4.tar.gz
SRC_DIR=dejagnu-1.4.4
BUILD_DIR=

prep_build "lfs"

patch -Np1 -i ../dejagnu-1.4.4-consolidated-1.patch
./configure --prefix=/tools
make install
make check

cleanup_build
