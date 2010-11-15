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
    if [ -e $HOME/$target_file ]; then
        mv -f $HOME/$target_file{,.orig}
    fi
    ln -s $HOME/dotfiles/$target_file $HOME/$target_file
done
