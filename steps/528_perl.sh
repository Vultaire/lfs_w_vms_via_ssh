#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/perl.html

source package_build.sh
TARBALL=perl-5.12.3.tar.bz2
SRC_DIR=perl-5.12.3
BUILD_DIR=

prep_build "lfs"

patch -Np1 -i ../perl-5.12.3-libc-1.patch

sh Configure -des -Dprefix=/tools \
                  -Dstatic_ext='Data/Dumper Fcntl IO'
make perl utilities ext/Errno/pm_to_blib

cp -v perl pod/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.12.3
cp -Rv lib/* /tools/lib/perl5/5.12.3

cleanup_build
