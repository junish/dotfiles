alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias em='emacs'
alias smc_2500='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 2710'
alias smc_4000='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 3e80'
alias smc_6200='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 60e0'

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
PS1="[\u@\h \W]# "
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
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
if [ "$TERM" = "screen" ]; then
    alias ssh=ssh_screen
fi
