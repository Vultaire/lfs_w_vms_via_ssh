#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/binutils-pass2.html

set -o nounset
set -o errexit

source shared.sh
match_user "lfs" || die 'This script must be run as the "lfs" user.'

cd $LFS/sources
tar -xf binutils-2.21.tar.bz2
cd binutils-2.21

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

# Cleanup
cd $LFS/sources
rm -rf binutils-2.21 binutils-build
