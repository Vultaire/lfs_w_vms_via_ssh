#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter02/creatingfilesystem.html

# This depends directly on the disk structure created in
# 22_partition_setup.sh.

function format_disk () {
    mke2fs -jv /dev/sda1
    mkswap /dev/sda5
    mke2fs -jv /dev/sda6
    mke2fs -jv /dev/sda7
}

######################################################################

set -o nounset
set -o errexit

source shared.sh
match_root || die "This script must be run as root."

format_disk
# Note: we don't do the feature check on the partitions, but if you're
# using the right Ubuntu host version, it should be okay.
