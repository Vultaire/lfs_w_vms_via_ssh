#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter04/creatingtoolsdir.html

set -o nounset
set -o errexit

source shared.sh
match_root || die "This script must be run as root."

mkdir -v $LFS/tools
ln -sv $LFS/tools /
