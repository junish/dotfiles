#!/bin/sh
tidy -quiet --gnu-emacs yes -config ~/.tidyrc "$1" 1>/dev/null
