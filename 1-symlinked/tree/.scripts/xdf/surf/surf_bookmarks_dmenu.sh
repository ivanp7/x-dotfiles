#!/bin/sh

if [ -n "$1" ]
then WINDOW_ARG="-w $1"; fi

DMENU_PROMPT_PATHS="Category"
DMENU_PROMPT_URLS="Bookmark"
DMENU_LINES=10

cd $HOME/.bookmarks

find . | dmenu.sh -p "$DMENU_PROMPT_PATHS" -l $DMENU_LINES -i $WINDOW_ARG | 
    xargs -I {} find {} -type f | xargs -I {} cat {} | 
    sed -E 's/\s*".*//; /^\s*$/d' | sed -E 's/^([^ ]*) *(.*)/\2 <\1>/' |
    ifne dmenu.sh -p "$DMENU_PROMPT_URLS" -l $DMENU_LINES -i $WINDOW_ARG | 
    sed -E 's/.*<([^ ]*)>$/\1/'

