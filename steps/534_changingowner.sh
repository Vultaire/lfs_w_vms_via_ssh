#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/changingowner.html

source shared.sh
forgive_nothing
match_user_or_die "root"

chown -R root:root $LFS/tools
