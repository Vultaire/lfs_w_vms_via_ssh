#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/dejagnu.html

set -o nounset
set -o errexit

source shared.sh
match_user "lfs" || die 'This script must be run as the "lfs" user.'

cd $LFS/sources
tar -xf dejagnu-1.4.4.tar.gz
cd dejagnu-1.4.4

patch -Np1 -i ../dejagnu-1.4.4-consolidated-1.patch
./configure --prefix=/tools
make install
make check

# Cleanup
cd $LFS/sources
rm -rf dejagnu-1.4.4
