#!/bin/bash

# Shared constants
LFS=/mnt/lfs

# Shared functions
function die () {
    echo "$@" > /dev/stdout
    exit 1
}

function match_root () {
    (( $(id -u) == 0 ))
}

function match_user () {
    user=$1
    [ "$(id -un)" == "$user" ]
}
