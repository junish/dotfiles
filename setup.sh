#!/bin/sh

TARGET_FILES=`cat << EOM
.screenrc
.gitigonre
.gitinit
.gitconfig
.vimrc
.vimperatorrc
.bash_profile
.bashrc
.wakeup
bin
EOM`

for target_file in $TARGET_FILES
do
    mv -f $HOME/$target_file{,.orig}
    ln -s $HOME/dotfiles/$target_file $HOME/$target_file
done
