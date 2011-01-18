#!/bin/sh

cmd() {
    echo "# $@"
    eval $@
}

#URL='http://svn.coderepos.org/share/lang/javascript/vimperator-plugins/trunk'
URL='http://svn.coderepos.org/share/lang/javascript/vimperator-plugins/branches/2.2/'

PLUGINS=`cat << EOM
_libly.js
_smooziee.js
auto_word_select_mode.js
bookmarktoolbar-hint.js
browser_object.js
caret-hint.js
char-hints-mod2.js
feedSomeKeys_2.js
forcefocuscontent.js
ime_controller.js
maine_coon.js
migemized_find.js
migemo_hint.js
migemo_completion.js
migemo-find.js
multi_requester.js
colors/sweets_snaka.vimp
EOM`

if [ ! -d $HOME/.vimperator ]; then
    cmd mkdir $HOME/.vimperator
fi

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
cmd popd
