if [ -d $HOME/.cabal/bin ]; then
    export PATH=$HOME/.cabal/bin:$PATH
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
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

if [ -d $HOME/android-sdk-macosx ]; then
    export PATH=$PATH:$HOME/android-sdk-macosx/tools
fi

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
#export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
#export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"

export EPREFIX=$HOME/Gentoo

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
