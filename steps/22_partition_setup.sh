#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter02/creatingpartition.html

# This script should set up the disk as follows:
#   pri     /boot   100 MB
#   ext     swap    2 GB
#   ext     /       10 GB
#   ext     /home   Remainder

function partition_disk () {
    # Partition the disk
    # Explanation:
    # - c\n: Turn off DOS compat
    # - u\n: Switch to sector display
    # - o\n: Create new DOS partition table
    # - n\np\n1\n\n+100M\n: Create pri part. 1 from start of disk, 100MB
    # - n\ne\n2\n\n\n: Create extended partition for remainder of disk.
    # - n\nl\n\n+2G\n: Create logical partition (5), from start, 2GB.
    # - n\nl\n\n+10G\n: Create logical partition (6), from start, 10 GB.
    # - n\nl\n\n\n: Create logical partition (7), from start, use remainder.
    # - t\n1\n83\n: Set partition 1 as type "Linux".
    # - t\n5\n82\n: Set partition 5 as type "Linux swap".
    # - t\n6\n83\n: Set partition 6 as type "Linux".
    # - t\n7\n83\n: Set partition 7 as type "Linux".
    # - w\n: Write to disk.

    echo -ne "c\nu\no\nn\np\n1\n\n+100M\nn\ne\n2\n\n\nn\nl\n\n+2G\nn\nl\n\n+10G\nn\nl\n\n\nt\n1\n83\nt\n5\n82\nt\n6\n83\nt\n7\n83\nw\n" \
	| fdisk /dev/sda
}

######################################################################

set -o nounset
set -o errexit

source shared.sh
match_root || die "This script must be run as root."

partition_disk
