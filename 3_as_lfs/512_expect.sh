#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/expect.html

source package_build.sh
TARBALL=expect5.45.tar.gz
SRC_DIR=expect5.45
BUILD_DIR=

prep_build "lfs"

cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

./configure --prefix=/tools --with-tcl=/tools/lib \
  --with-tclinclude=/tools/include
make
#make test
make SCRIPTS="" install

cleanup_build
