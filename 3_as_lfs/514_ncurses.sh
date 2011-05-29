#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/ncurses.html

set -o nounset
set -o errexit

source shared.sh
match_user "lfs" || die 'This script must be run as the "lfs" user.'

cd $LFS/sources
tar -xf ncurses-5.7.tar.gz
cd ncurses-5.7

./configure --prefix=/tools --with-shared \
    --without-debug --without-ada --enable-overwrite
make
make install

# Cleanup
cd $LFS/sources
rm -rf ncurses-5.7
