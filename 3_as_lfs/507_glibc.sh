#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/glibc.html

source package_build.sh
TARBALL=glibc-2.13.tar.bz2
SRC_DIR=glibc-2.13
BUILD_DIR=glibc-build

prep_build "lfs"

patch -Np1 -i ../glibc-2.13-gcc_fix-1.patch

mkdir -v ../glibc-build
cd ../glibc-build

case `uname -m` in
  i?86) echo "CFLAGS += -march=i486 -mtune=native" > configparms ;;
esac

../glibc-2.13/configure --prefix=/tools \
    --host=$LFS_TGT --build=$(../glibc-2.13/scripts/config.guess) \
    --disable-profile --enable-add-ons \
    --enable-kernel=2.6.22.5 --with-headers=/tools/include \
    libc_cv_forced_unwind=yes libc_cv_c_cleanup=yes
make
make install

cleanup_build
