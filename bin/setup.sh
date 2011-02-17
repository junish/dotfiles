#!/bin/sh

~/dotfiles/setup-dotfiles.sh
~/dotfiles/setup-yum.sh
/bin/mv -f ~/.vim ~/.vim.orig
~/dotfiles/vim-update-bundles
pushd ~/.vim/bundle/vimproc/
make -f make_gcc.mak
popd
