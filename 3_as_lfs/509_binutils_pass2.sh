#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/binutils-pass2.html

source package_build.sh
TARBALL=binutils-2.21.tar.bz2
SRC_DIR=binutils-2.21
BUILD_DIR=binutils-build

prep_build "lfs"

mkdir -v ../binutils-build
cd ../binutils-build

CC="$LFS_TGT-gcc -B/tools/lib/" \
   AR=$LFS_TGT-ar RANLIB=$LFS_TGT-ranlib \
   ../binutils-2.21/configure --prefix=/tools \
   --disable-nls --with-lib-path=/tools/lib
make
make install

make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin

cleanup_build
