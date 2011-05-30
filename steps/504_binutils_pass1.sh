#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/binutils-pass1.html

set -o nounset
set -o errexit

source shared.sh
match_user "lfs" || die 'This script must be run as the "lfs" user.'

cd $LFS/sources
tar -xf binutils-2.21.tar.bz2 
cd binutils-2.21

mkdir -v ../binutils-build
cd ../binutils-build

time {
    ../binutils-2.21/configure \
	--target=$LFS_TGT --prefix=/tools \
	--disable-nls --disable-werror
    make
    make install
}

# Cleanup
cd $LFS/sources
rm -rf binutils-2.21 binutils-build
