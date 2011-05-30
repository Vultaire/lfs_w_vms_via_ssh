#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/bash.html

source package_build.sh
TARBALL=bash-4.2.tar.gz
SRC_DIR=bash-4.2
BUILD_DIR=

prep_build "lfs"

./configure --prefix=/tools --without-bash-malloc
make
#make tests
make install
ln -vs bash /tools/bin/sh

cleanup_build
