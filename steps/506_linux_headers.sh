#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/linux-headers.html

source package_build.sh
TARBALL=linux-2.6.37.tar.bz2
SRC_DIR=linux-2.6.37
BUILD_DIR=

prep_build "lfs"

make mrproper

make headers_check
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

cleanup_build
