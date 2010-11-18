#!/bin/sh

cmd() {
    echo "# $@"
    eval $@
}

TARGET_FILES=`cat << EOM
.screenrc
.gitigonre
.gitinit
.gitconfig
.vimrc
.vimperatorrc
.bash_profile
.bashrc
.bluetilerc
.wakeup
bin
EOM`

for target_file in $TARGET_FILES
do
    if [ -e $HOME/$target_file ]; then
        cmd mv -f $HOME/$target_file{,.orig}
    fi
    cmd ln -s $HOME/dotfiles/$target_file $HOME/$target_file
done

INSTALL_PKGS=`cat << EOM
gcc
git
ruby
screen
cabal-install
ghc-glade-devel
xmonad
EOM`

for install_pkg in $INSTALL_PKGS
do
    rpm -q $install_pkg > /dev/null
    if [ $? -ne 0 ]; then
        cmd yum -y install $install_pkg
    fi
done
