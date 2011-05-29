#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/ncurses.html

source package_build.sh
TARBALL=ncurses-5.7.tar.gz
SRC_DIR=ncurses-5.7
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools --with-shared \
    --without-debug --without-ada --enable-overwrite
make
make install

cleanup_build
