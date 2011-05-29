#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/expect.html

set -o nounset
set -o errexit

source shared.sh
match_user "lfs" || die 'This script must be run as the "lfs" user.'

cd $LFS/sources
tar -xf expect5.45.tar.gz
cd expect5.45

cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

./configure --prefix=/tools --with-tcl=/tools/lib \
  --with-tclinclude=/tools/include
make
#make test
make SCRIPTS="" install

# Cleanup
cd $LFS/sources
rm -rf expect5.45
