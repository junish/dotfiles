#!/bin/bash

cmd() {
    echo "$PS2 $@"
    eval $@
}

cmd ~/dotfiles/bin/setup-dotfiles.sh
if [ "$USER" == "root" ]; then
    cmd ~/dotfiles/bin/setup-yum.sh
fi
