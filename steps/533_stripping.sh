#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/stripping.html

# This is not strictly necessary, but we'll do it anyway.  After all,
# the idea is to automate everything, and these tools won't exist
# later anyway.

source shared.sh
forgive_nothing
match_user_or_die "lfs"

strip --strip-debug /tools/lib/*
strip --strip-unneeded /tools/{,s}bin/*

rm -rf /tools/{,share}/{info,man}
