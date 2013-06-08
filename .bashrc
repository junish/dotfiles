if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

###
# Prompt settings
#
if [ "$USER" == "root" ]; then
    PS1="[\u@\h \W]# "
else
    PS1="[\u@\h \W]$ "
fi

# Ctrl+Q, Ctrl+S無効
#stty start undef
#stty stop undef

export GIT_PAGER='less -r -I'

export HISTSIZE=30000

###
# Define envelopement variables
#
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
alias tmux='tmux -2'
alias pub='python -m SimpleHTTPServer'
alias google-chrome='google-chrome --user-data-dir=$HOME/.config/google-chrome'
alias cpan-uninstall='perl -MConfig -MExtUtils::Install -e '"'"'($FULLEXT=shift)=~s{-}{/}g;uninstall "$Config{sitearchexp}/auto/$FULLEXT/.packlist",1'"'"

#alias vim='mvim -v'
alias em='emacs'
alias ls='LSCOLORS=gxfxcxdxbxegedabagacad ls -GF'
alias smc_2500='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 2710'
alias smc_4000='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 3e80'
alias smc_6200='/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mx -w 60e0'

###
# Local bashrc for Tmux
#
if [ -f $HOME/.bashrc.tmux ]; then
    . $HOME/.bashrc.tmux
fi

###
# Local bashrc
#
if [ -f $HOME/.bashrc.local ]; then
    . $HOME/.bashrc.local
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
