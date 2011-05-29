#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/glibc.html

set -o nounset
set -o errexit

source shared.sh
match_user "lfs" || die 'This script must be run as the "lfs" user.'

cd $LFS/sources
tar -xf glibc-2.13.tar.bz2
cd glibc-2.13

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

# Cleanup
cd $LFS/sources
rm -rf glibc-2.13 glibc-build
