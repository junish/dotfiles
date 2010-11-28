#!/bin/sh

cmd() {
    echo "# $@"
    eval $@
}

TARGET_FILES=`cat << EOM
.screenrc
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
    if [ -e $HOME/$target_file ]; then
        cmd mv -f $HOME/$target_file{,.orig}
    fi
    cmd ln -s $HOME/dotfiles/$target_file $HOME/$target_file
done
