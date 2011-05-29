#!/bin/bash

# This should be run on the host system to ensure that necessary
# programs are installed.

function install_prereqs () {
    # Bash: assign /bin/sh to /bin/bash
    ln -sfv /bin/bash /bin/sh

    apt-get install -y bison

    # Gawk should be installed and set as the default awk.
    apt-get install -y gawk
    update-alternatives --set awk /usr/bin/gawk

    # Patch
    apt-get install -y patch

    # Texinfo
    apt-get install texinfo
}

function modify_system_bashrc () {
    # This is outside the scope of the LFS docs.  It's a trivial fix
    # related to the PS1 environment variable.
    #
    # /etc/bash.bashrc modifies PS1.  This will disable it.

    sed -i /etc/bash.bashrc -e 's/^PS1=/#PS1=/'

    # Reason: on a login shell in the Ubuntu Live CD, files get read
    # in this order:
    #
    # - /etc/profile
    # - /etc/bash.bashrc
    # - ~/.bash_profile
    # - /etc/bash.bashrc
    # - ~/.bashrc
    #
    # That is, not only are /etc/profile and ~/.bash_profile read, but
    # additionally /etc/bash.bashrc and ~/.bashrc are also read.
}

function create_version_check_script () {
    # Source of the following script:
    # http://www.linuxfromscratch.org/lfs/view/stable/prologue/hostreqs.html
    cat > version-check.sh << "EOF"
#!/bin/bash
export LC_ALL=C

# Simple script to list version numbers of critical development tools

bash --version | head -n1 | cut -d" " -f2-4
echo "/bin/sh -> `readlink -f /bin/sh`"
echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-
bison --version | head -n1
if [ -e /usr/bin/yacc ];
  then echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`"; 
  else echo "yacc not found"; fi
bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2
diff --version | head -n1
find --version | head -n1
gawk --version | head -n1
if [ -e /usr/bin/awk ];
  then echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`"; 
  else echo "awk not found"; fi
gcc --version | head -n1
/lib/libc.so.6 | head -n1 | cut -d"," -f1
grep --version | head -n1
gzip --version | head -n1
cat /proc/version
m4 --version | head -n1
make --version | head -n1
patch --version | head -n1
echo Perl `perl -V:version`
sed --version | head -n1
tar --version | head -n1
echo "Texinfo: `makeinfo --version | head -n1`"
echo 'main(){}' > dummy.c && gcc -o dummy dummy.c
if [ -x dummy ]; then echo "Compilation OK";
  else echo "Compilation failed"; fi
rm -f dummy.c dummy

EOF
}

######################################################################

set -o nounset
set -o errexit

source shared.sh
match_root || die "This script must be run as root."

cd ~/

# For everyone:
install_prereqs
modify_system_bashrc
create_version_check_script
bash version-check.sh
