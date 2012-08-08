if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

###
# Prompt settings
#
PS1="[\u@\h \W]# "

# Ctrl+Q, Ctrl+S無効
stty start undef
stty stop undef

###
# Define envelopement variables
#
SYSTEM=$(uname -s)

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
#export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
#export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
export EPREFIX=$HOME/Gentoo

if [ -d $HOME/.virtualenvs ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source `which virtualenvwrapper.sh`
fi

###
# Define alias
#

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias em='emacs'
alias pub='python -m SimpleHTTPServer'

if [ "$SYSTEM" == "Darwin" ]; then
    alias vim='mvim -v'
    alias em='emacs'
    alias ls='LSCOLORS=gxfxcxdxbxegedabagacad ls -GF'
    alias smc_2500='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 2710'
    alias smc_4000='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 3e80'
    alias smc_6200='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 60e0'
elif [ "$SYSTEM" == "Linux" ]; then
    alias ls='ls -F --color=auto'
fi

###
# For tmux
#

function ereg(){
    local _reg=$1
    local _text=$2
    echo "${_text}" | grep -E -q "${_reg}"
    if [ $? -ne 0 ]; then
        return 1
    fi
    return 0
}

function check_ipaddres(){
    local _text=$1
    ereg '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "${_text}"
    if [ $? -ne 0 ]; then
        return 1
    fi
    return 0
}

function ssh_screen(){
    eval server=\${$#}
    check_ipaddres "${server}" 
    if [ $? -eq 0 ]; then
        server=$(echo ${server})
    else
        server=$(echo ${server} | cut -d . -f 1)
    fi
    screen -t ${server} ssh "$@"

}

function ssh_tmux(){
    eval server=\${$#}
    check_ipaddres "${server}" 
    if [ $? -eq 0 ]; then
        server=$(echo ${server})
    else
        server=$(echo ${server} | cut -d . -f 1)
    fi
    eval tmux new-window -n "'${server}'" "'ssh $@'"
}

if [ "$TERM" == 'screen' ]; then
    if [ -n "$TMUX" ]; then
        alias ssh=ssh_tmux
    else
        alias ssh=ssh_screen
    fi
fi

###
# Optimization
# http://lists.fedoraproject.org/pipermail/users/2010-November/387409.html
#

#if [ "$SYSTEM" == "Linux" ]; then
#    if [ "$PS1" ] ; then
#        mkdir -m 0700 -p /cgroup/cpu/user/$$
#        echo 1>  /cgroup/cpu/user/$$/notify_on_release
#        echo $$>  /cgroup/cpu/user/$$/tasks
#        ### NOTICE
#        # create /bin/rmcgroup:
#        #     #!/bin/bash
#        #     rmdir /cgroup/cpu/$1
#        # add to /etc/rc.local:
#        #     mount -t cgroup -o cpu none /cgroup/cpu
#        #     mkdir -p -m 0777 /cgroup/cpu/user
#        #     echo "/bin/rmcgroup">  /cgroup/cpu/release_agent
#    fi
#fi
