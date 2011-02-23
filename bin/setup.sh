#!/bin/sh

~/dotfiles/bin/setup-dotfiles.sh
~/dotfiles/bin/setup-yum.sh
/bin/mv -f ~/.vim ~/.vim.orig
~/dotfiles/bin/vim-update-bundles
#pushd ~/.vim/bundle/vimproc/
#make -f make_gcc.mak
#popd
