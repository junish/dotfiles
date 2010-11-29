if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

if [ -d /opt/local/bin ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/share/man:$MANPATH
fi

if [ -d $HOME/bin ]; then
    export PATH=$PATH:$HOME/bin
fi

if [ -d $HOME/android-sdk-mac_x86 ]; then
    export PATH=$PATH:$HOME/android-sdk-mac_x86/tools
fi

if [ -d $HOME/.cabal ]; then
    $HOME/.cabal/bin/bluetile > /dev/null 2>&1 &
fi

if [ -f $HOME/.bashrc ]; then
    source .bashrc
fi
