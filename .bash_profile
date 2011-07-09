if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

<<<<<<< Updated upstream
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
=======
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
>>>>>>> Stashed changes
fi

if [ -d /opt/local/bin ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/share/man:$MANPATH
fi

if [ -d $HOME/android-sdk-mac_x86 ]; then
    export PATH=$PATH:$HOME/android-sdk-mac_x86/tools
fi

#if [ ! -z "$PS1" ]; then
#    _tmuxrc="$HOME/.bashrc.tmux"
#    if [ -e $_tmuxrc ]; then
#        source $_tmuxrc
#        _tmux-init-history
#    fi
#fi

if [ -f $HOME/.bashrc ]; then
    source .bashrc
fi
