if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias em='emacs'
if [ "`uname -s`" == "Darwin" ]; then
    alias ls='LSCOLORS=gxfxcxdxbxegedabagacad ls -GF'
    alias smc_2500='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 2710'
    alias smc_4000='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 3e80'
    alias smc_6200='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 60e0'
elif [ "`uname -s`" == "Linux" ]; then
    alias ls='ls -F --color=auto'
    if [ "$PS1" ] ; then
        # http://lists.fedoraproject.org/pipermail/users/2010-November/387409.html
        mkdir -m 0700 -p /cgroup/cpu/user/$$
        echo 1>  /cgroup/cpu/user/$$/notify_on_release
        echo $$>  /cgroup/cpu/user/$$/tasks
        ### NOTICE
        # create /bin/rmcgroup:
        #     #!/bin/bash
        #     rmdir /cgroup/cpu/$1
        # add to /etc/rc.local:
        #     mount -t cgroup -o cpu none /cgroup/cpu
        #     mkdir -p -m 0777 /cgroup/cpu/user
        #     echo "/bin/rmcgroup">  /cgroup/cpu/release_agent
    fi
fi

PS1="[\u@\h \W]# "
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Ctrl+S無効
stty stop undef

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
    eval tmux new-window -n "'${server}'" "'ssh $@'"
}

if [ -n "$TMUX" ]; then
    alias ssh=ssh_screen
fi
