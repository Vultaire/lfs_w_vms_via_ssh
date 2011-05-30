#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter02/mounting.html

# This depends directly on the disk structure created in the previous
# two scripts.

source shared.sh

function prep_sources_dir () {
    mkdir -v $LFS/sources
    chmod -v a+wt $LFS/sources
}

function download_sources () {
    wget "http://www.linuxfromscratch.org/lfs/view/stable/wget-list"
    wget -i wget-list -P $LFS/sources
}

######################################################################

set -o nounset
set -o errexit

match_root || die "This script must be run as root."

prep_sources_dir
download_sources
