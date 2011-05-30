# Functions for package building
#
# If you use these functions, you need to define the following
# variables:
#
# - TARBALL: The tarball's file name.  No path component.
# - SRC_DIR: The tarball's extracted directory name.
# - BUILD_DIR: If a separate build directory is used, specify it.  If
#       not, define but leave blank.
#
# So as not to require touching the original LFS procedures, the
# BUILD_DIR is not auto-created.  It is used purely for
# cleanup_build().

source shared.sh

function prep_build () {
    user="$1"

    forgive_nothing
    match_user_or_die "$user"

    cd $LFS/sources
    tar -xf "$TARBALL"
    cd "$SRC_DIR"
}

function cleanup_build () {
    cd $LFS/sources
    rm -rf "$SRC_DIR"
    if [ ! -z "$BUILD_DIR" ]; then
	rm -rf "$BUILD_DIR"
    fi
}
