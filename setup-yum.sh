#!/bin/sh

cmd() {
    echo "# $@"
    eval $@
}

INSTALL_PKGS=`cat << EOM
gcc
git
ruby
cabal-install
ghc-glade-devel
xmonad
svn
screen
bash-completion
EOM`

for install_pkg in $INSTALL_PKGS
do
    rpm -q $install_pkg > /dev/null
    if [ $? -ne 0 ]; then
        cmd yum -y install $install_pkg
    fi
done
