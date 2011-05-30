#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/coreutils.html

source package_build.sh
TARBALL=coreutils-8.10.tar.gz
SRC_DIR=coreutils-8.10
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools --enable-install-program=hostname
make
#make RUN_EXPENSIVE_TESTS=yes check
make install

cp -v src/su /tools/bin/su-tools

cleanup_build
