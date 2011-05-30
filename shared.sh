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

function forgive_nothing () {
    set -o nounset
    set -o errexit
}

function match_user_or_die () {
    user="$1"
    match_user "$user" || die "This script must be run as the \"$user\" user."
}
