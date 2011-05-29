#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/gcc-pass2.html

set -o nounset
set -o errexit

source shared.sh
match_user "lfs" || die 'This script must be run as the "lfs" user.'

cd $LFS/sources
tar -xf gcc-4.5.2.tar.bz2
cd gcc-4.5.2

patch -Np1 -i ../gcc-4.5.2-startfiles_fix-1.patch

cp -v gcc/Makefile.in{,.orig}
sed 's@\./fixinc\.sh@-c true@' gcc/Makefile.in.orig > gcc/Makefile.in

cp -v gcc/Makefile.in{,.tmp}
sed 's/^T_CFLAGS =$/& -fomit-frame-pointer/' gcc/Makefile.in.tmp \
  > gcc/Makefile.in

for file in \
 $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h)
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
  -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_INCLUDE_DIR
#define STANDARD_INCLUDE_DIR 0
#define STANDARD_STARTFILE_PREFIX_1 ""
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done

tar -jxf ../mpfr-3.0.0.tar.bz2
mv -v mpfr-3.0.0 mpfr
tar -jxf ../gmp-5.0.1.tar.bz2
mv -v gmp-5.0.1 gmp
tar -zxf ../mpc-0.8.2.tar.gz
mv -v mpc-0.8.2 mpc

mkdir -v ../gcc-build
cd ../gcc-build

CC="$LFS_TGT-gcc -B/tools/lib/" \
    AR=$LFS_TGT-ar RANLIB=$LFS_TGT-ranlib \
    ../gcc-4.5.2/configure --prefix=/tools \
    --with-local-prefix=/tools --enable-clocale=gnu \
    --enable-shared --enable-threads=posix \
    --enable-__cxa_atexit --enable-languages=c,c++ \
    --disable-libstdcxx-pch --disable-multilib \
    --disable-bootstrap --disable-libgomp \
    --with-gmp-include=$(pwd)/gmp --with-gmp-lib=$(pwd)/gmp/.libs \
    --without-ppl --without-cloog
make
make install

ln -vs gcc /tools/bin/cc

# SANITY CHECK
cd ~

echo    "Expected: [Requesting program interpreter: /tools/lib/ld-linux.so.2]"
echo -n "Real:     "

echo 'main(){}' > dummy.c
cc dummy.c
readelf -l a.out | grep ': /tools'

rm -v dummy.c a.out

# Cleanup
cd $LFS/sources
rm -rf gcc-4.5.2 gcc-build
