#!/bin/sh

cmd() {
    echo "# $@"
    eval $@
}

URL='http://svn.coderepos.org/share/lang/javascript/vimperator-plugins/trunk'
BRANCHES_URL='http://svn.coderepos.org/share/lang/javascript/vimperator-plugins/branches/2.2'

PLUGINS=`cat << EOM
_libly.js
auto_word_select_mode.js
bookmarktoolbar-hint.js
browser_object.js
caret-hint.js
char-hints-mod2.js
feedSomeKeys_2.js
forcefocuscontent.js
ime_controller.js
migemized_find.js
migemo_hint.js
migemo_completion.js
migemo-find.js
multi_requester.js
toggler.js
EOM`

BRANCHES_PLUGINS=`cat << EOM
EOM`

cmd rm -rf $HOME/.vimperator
cmd mkdir $HOME/.vimperator

if [ ! -d $HOME/.vimperator/plugin ]; then
    cmd pushd $HOME/.vimperator
    cmd svn checkout $URL plugin
    cmd rm -f $HOME/.vimperator/plugin/*
    cmd rm -f $HOME/.vimperator/plugin/*/*
    cmd popd
fi

cmd pushd $HOME/.vimperator/plugin
for plugin in $PLUGINS
do
    cmd svn update $plugin
done
for branches_plugin in $BRANCHES_PLUGINS
do
    cmd curl -o $branches_plugin $BRANCHES_URL/$branches_plugin
done
cmd popd
