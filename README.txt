WATH'S THIS
    必要なドットファイル、bin、パッケージを整える環境

INSTALL
    ドットファイルとbinをカレントディレクトリに反映させる
        # cd dotfiles; ./set-dotfiles.sh

    必要なパッケージをインストールする
        # set-yum.sh

    .vimを作成する
        # vim-update-bundles

    vimshellを使用しているため、vimprocをコンパイルする
        # pushd ~/.vim/bundle/vimproc/; make -f make_gcc.mak; popd

THANKS
    https://github.com/bronson/vim-update-bundles.git
    https://github.com/cooldaemon/myhome.git
    https://github.com/yuroyoro/dotfiles.git
    https://github.com/ujihisa/config.git
