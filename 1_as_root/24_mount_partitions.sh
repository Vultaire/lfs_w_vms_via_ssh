#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter02/mounting.html

# This depends directly on the disk structure created in the previous
# two scripts.

source shared.sh

function mount_partitions () {
    mkdir -pv $LFS
    mount -v -t ext3 /dev/sda6 $LFS
    mkdir -pv $LFS/boot
    mount -v -t ext3 /dev/sda1 $LFS/boot
    mkdir -pv $LFS/home
    mount -v -t ext3 /dev/sda7 $LFS/home
    /sbin/swapon -v /dev/sda5
}

######################################################################

set -o nounset
set -o errexit

match_root || die "This script must be run as root."

mount_partitions
