#!/bin/sh

cmd() {
    echo "$PS4 $@"
    eval $@
}

if [ "$USER" == "root" ]; then
    TARGET_FILES=`cat << EOM
.inputrc
.gitignore
.gitconfig
.vimrc.core
.bash_profile
.bashrc
bin
EOM`
else
    TARGET_FILES=`cat << EOM
.inputrc
.screenrc
.tmux.conf
.gitignore
.gitconfig
.vimrc.core
.vimrc
.vimperatorrc
.bash_profile
.bashrc
.bashrc.tmux
.bluetilerc
.wakeup
bin
EOM`
fi

for target_file in $TARGET_FILES
do
    if [ -e $HOME/$target_file ]; then
        if [ ! -L $HOME/$target_file ]; then
            cmd mv -f $HOME/$target_file $HOME/$target_file.orig
            cmd ln -s $HOME/dotfiles/$target_file $HOME/$target_file
        fi
    else
        cmd ln -s $HOME/dotfiles/$target_file $HOME/$target_file
    fi
done

if [ "$USER" == "root" ]; then
    if [ -e $HOME/.vimrc.core -a ! -e $HOME/.vimrc ]; then
        cmd mv -f $HOME/.vimrc.core $HOME/.vimrc
    else
        cmd rm -f $HOME/.vimrc.core
    fi
fi

if [ -d $HOME/.vim -a ! -d $HOME/.vim.orig ]; then
    cmd /bin/mv -f ~/.vim ~/.vim.orig
fi
