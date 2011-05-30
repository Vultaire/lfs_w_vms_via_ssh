#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/gettext.html

source package_build.sh
TARBALL=gettext-0.18.1.1.tar.gz
SRC_DIR=gettext-0.18.1.1
BUILD_DIR=

prep_build "lfs"

cd gettext-tools
./configure --prefix=/tools --disable-shared
make -C gnulib-lib
make -C src msgfmt

cp -v src/msgfmt /tools/bin

cleanup_build
