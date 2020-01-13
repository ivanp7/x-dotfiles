#!/bin/sh

if [ -n "$1" ]; then WINDOW_ARG="-w $1"; fi
DMENU_PROMPT_BOOKMARK="${2:-Bookmark}"
DMENU_PROMPT_CATEGORY="${3:-Category}"

DMENU_LINES=10

[ ! -d "$HOME/.bookmarks" ] && exit 1
cd $HOME/.bookmarks

find . -path "./.git" -prune -o \! -name ".gitignore" -print | sed 's,^\./,,' | sort | 
    dmenu -fn "$DEFAULT_FONT" -p "$DMENU_PROMPT_CATEGORY" -l $DMENU_LINES -i $WINDOW_ARG | 
    xargs -I {} find {} -type f | xargs -I {} cat {} | 
    sed -E 's/\s*".*//; /^\s*$/d' | sed -E 's/^([^ ]*) *(.*)/\2 <\1>/' |
    ifne dmenu -fn "$DEFAULT_FONT" -p "$DMENU_PROMPT_BOOKMARK" -l $DMENU_LINES -i $WINDOW_ARG | 
    sed -E 's/.*<([^ ]*)>$/\1/'

