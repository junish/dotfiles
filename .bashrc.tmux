# -*- shell-script -*-
#
# .bashrc.tmux - tmux-related functions and aliases for bash
#
# This is part of: http://blogs.edsantiago.com/articles/FIXME
#

#
# On LOGIN: enable a separate history file for this session
#
_tmux-init-history() {
    # Only interested in interactive shells running under tmux
    test -z "$PS1"  && return
    test -z "$TMUX" && return

    # Get our current tmux session id (eg devel.bz12345).
    # If empty, or if unnamed session (0, 1, 2, etc), do not save history.
    tmux_session=$(tmux-session mywindowid)
    test -z "$tmux_session" && return

    case "$tmux_session" in
        [0-9]*)   return ;;
    esac

    histdir=$HOME/.bash_history.d
    # Create the dir on demand
    if [ ! -d $histdir ]; then
        mkdir $histdir
    fi

    histfile=$histdir/$tmux_session

    # Create the file on demand
    if [ ! -f $histfile ]; then
        touch $histfile
    fi
    chmod  0600 $histfile

    HISTFILE=$histfile
    HISTTIMEFORMAT='%F %T '
    HIST_DIRSTACK=$histfile.dirs
    # FIXME: on first pass through, restore dirs
    dirstack_reset=
    if [ -f $HIST_DIRSTACK ]; then
        while read d;do
            if [ -z "$dirstack_reset" ]; then
                builtin cd "$d"
                dirstack_reset=reset
            else
                builtin pushd "$d" >/dev/null
            fi
        done < <(tac $HIST_DIRSTACK)
    fi

    # Restore $OLDPWD, to allow cd -
    if [ -f $HIST_DIRSTACK- ]; then
        OLDPWD=$(< $HIST_DIRSTACK-)
    fi

    # Save history after every command.  This saves our bacon if we crash.
    if [ -n "$PROMPT_COMMAND" ]; then
        PROMPT_COMMAND="$PROMPT_COMMAND;history -w"
    else
        PROMPT_COMMAND="history -w"
    fi
}

#
# On LOGOUT: if tmux window has been renamed, FIXME
#
_tmux-fixme() {
    test -z "$tmux_session" && return

    new_tmux_session=$(tmux-session mywindowid)
    test -z "$new_tmux_session" && return

    # Unchanged.
    test "$new_tmux_session" = "$tmux_session" && return

    # Changed.
    # FIXME: rename histfile
}

#
# Directory-changing aliases.  Preserve current directory stack.
#

_tmux-save-dir-stack() {
    # Save both dirlist and $OLDPWD, so we can 'cd -' upon restore
    if [ -n "$HIST_DIRSTACK" ]; then
        builtin dirs -p -l >| $HIST_DIRSTACK
        echo $OLDPWD       >| $HIST_DIRSTACK-
    fi
}

P()   { builtin pushd "$@"; _tmux-save-dir-stack; }
p()   { builtin  popd "$@"; _tmux-save-dir-stack; }
cd()  { builtin    cd "$@"; _tmux-save-dir-stack; }

#
# For creating a new session.
#
tt()  { tmux-session new "$@"; }

# tmux-restore is useful when you <prefix>-c to create a new window,
# and immediately want to recover/restore from another session.
# It would be better to use tt, but sometimes we forget.
tmux-restore() {
    tmux rename-window "$@" && _tmux-init-history && history -r && _tmux-save-dir-stack
}

# tmux-rename is useful when you want to rename this session but keep
# your work.  (tmux-restore clobbers your history and directories).
tmux-rename() {
    tmux rename-window "$@"
    tmux_session=$(tmux-session mywindowid)
    HISTFILE=$HOME/.bash_history.d/$tmux_session
}

#
# utils
#
function _ereg(){
    local _reg=$1
    local _text=$2
    echo "${_text}" | grep -E -q "${_reg}"
    if [ $? -ne 0 ]; then
        return 1
    fi
    return 0
}

function _check_ipaddres(){
    local _text=$1
    _ereg '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "${_text}"
    if [ $? -ne 0 ]; then
        return 1
    fi
    return 0
}

function ssh_screen(){
    eval server=\${$#}
    _check_ipaddres "${server}" 
    if [ $? -eq 0 ]; then
        server=$(echo ${server})
    else
        server=$(echo ${server} | cut -d . -f 1)
    fi
    screen -t ${server} ssh "$@"

}

function ssh_tmux(){
    eval server=\${$#}
    _check_ipaddres "${server}" 
    if [ $? -eq 0 ]; then
        server=$(echo ${server})
    else
        server=$(echo ${server} | cut -d . -f 1)
    fi
    eval tmux new-window -n "'${server}'" "'ssh $@'"
}

tmux-new-session() {
    TMUX_DEFAULT_COLOR="black"
    TMUX_COLORS=("#DUMMY0", "#689FFF" "#FF6F40" "#00CB90" "blue" "red" "green")
    tmux_count=`tmux ls 2> /dev/null | wc -l`
    session_id=1
    session_id=`expr $tmux_count + 1`
    tmux new-session -d -s $session_id
    tmux_color=${TMUX_COLORS[$session_id]}
    if [ "$tmux_color" == "" ]; then
        tmux set -t $session_id status-bg $TMUX_DEFAULT_COLOR
    else
        tmux set -t $session_id status-bg $tmux_color
    fi
    tmux attach-session -t $session_id
}

#
# new window with ssh in tmux
#
if [ "$TERM" == 'screen' -o "$TERM" == 'screen-256color' ]; then
    if [ -n "$TMUX" ]; then
        alias ssh=ssh_tmux
    else
        alias ssh=ssh_screen
    fi
fi

#
# auto new session and auto set status bg color
# "dump" is for logining with GUI
if [ "$TERM" != "dumb" -a -z "$TMUX" ]; then
    tmux-new-session
    _tmux-init-history
fi
