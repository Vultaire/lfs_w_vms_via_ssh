#!/bin/bash

# LFS Reference:
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/adjusting.html

set -o nounset
set -o errexit

source shared.sh
match_user "lfs" || die 'This script must be run as the "lfs" user.'

SPECS=`dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/specs
$LFS_TGT-gcc -dumpspecs | sed \
  -e 's@/lib\(64\)\?/ld@/tools&@g' \
  -e "/^\*cpp:$/{n;s,$, -isystem /tools/include,}" > $SPECS 
echo "New specs file is: $SPECS"
unset SPECS

# From here is simply some sanity checks.

cd ~/

echo    "EXPECTING OUTPUT: [Requesting program interpreter: /tools/lib/ld-linux.so.2]"
echo -n "Real output:      "
echo 'main(){}' > dummy.c
$LFS_TGT-gcc -B/tools/lib dummy.c
readelf -l a.out | grep ': /tools'

rm -v dummy.c a.out
