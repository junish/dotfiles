#!/bin/sh

./setup-dotfiles.sh
./setup-yum.sh
./vim-update-bundles
pushd ~/.vim/bundle/vimproc/
make -f make_gcc.mak
popd
