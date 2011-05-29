#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter04/addinguser.html

set -o nounset
set -o errexit

source shared.sh
match_root || die "This script must be run as root."

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

echo 'Setting password of "lfs" user.'
passwd lfs

chown -v lfs $LFS/tools
chown -v lfs $LFS/sources

echo 'ATTENTION: The next script must be run via the "lfs" user via a' \
    'login shell:'
echo
echo -e "\tsu - lfs"
echo
