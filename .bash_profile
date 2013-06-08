if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

###
# Change PATH
#

if [ -d $HOME/.cabal/bin ]; then
    export PATH=$HOME/.cabal/bin:$PATH
fi

if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

if [ -d /opt/local/bin ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/share/man:$MANPATH
fi

if [ -d /opt/node/bin ]; then
    export PATH=/opt/node/bin:$PATH
fi

if [ -d /usr/local/cuda/bin ]; then
    export PATH=/usr/local/cuda/bin:$PATH
fi

if [ -d $HOME/node_modules/.bin ]; then
    export PATH=$HOME/node_modules/.bin:$PATH
fi

if [ -d $HOME/android-sdk-macosx ]; then
    export PATH=$PATH:$HOME/android-sdk-macosx/tools
fi

if [ -d $HOME/.vim/bundle/css.vim--Streppone ]; then
    export PATH=$PATH:$HOME/.vim/bundle/css.vim--Streppone
fi

rpm -q erlang > /dev/null 2>&1
if [ $? -eq 0 ]; then
    LIB_NAME='lib'
    MACHINE=`uname -m`
    if [ 'x86_64' == "$MACHINE"  ]; then
        LIB_NAME='lib64'
    fi
    ERL_LIBBIN_PATH=`echo /usr/$LIB_NAME/erlang/lib/*/bin | sed -e 's/ /:/g'`
    export PATH="$PATH:$ERL_LIBBIN_PATH"
fi

test -s "$HOME/.rvm/scripts/rvm" && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
