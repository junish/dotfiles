#!/bin/sh

cmd() {
    echo "# $@"
    eval $@
}

TARGET_FILES=`cat << EOM
.inputrc
.screenrc
.tmux.conf
.gitigonre
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
    if [ ! -L $HOME/$target_file ]; then
        cmd mv -f $HOME/$target_file $HOME/$target_file.orig
        cmd ln -s $HOME/dotfiles/$target_file $HOME/$target_file
    fi
done
