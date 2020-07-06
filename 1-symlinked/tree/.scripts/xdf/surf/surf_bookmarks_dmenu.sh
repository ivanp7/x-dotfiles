#!/bin/sh

[ -n "$1" ] && WINDOW_ARG="-w $1"
DMENU_PROMPT_BOOKMARK="${2:-Bookmark}"
DMENU_PROMPT_CATEGORY="${3:-Category}"

DMENU_LINES=10

BOOKMARKS_DIR=$XDG_DATA_HOME/bookmarks
cd "$BOOKMARKS_DIR" || exit 1

find . -path "./.git" -prune -o \! -name ".gitignore" -print | sed 's,^\./,,' | sort | 
    dmenu -fn "$DEFAULT_FONT" -p "$DMENU_PROMPT_CATEGORY" -l $DMENU_LINES -i $WINDOW_ARG | 
    xargs -I {} find {} -path "./.git" -prune -o \! -name ".gitignore" -type f -print |
    xargs -I {} cat {} | sed -E 's/\s*".*//; /^\s*$/d' | sed -E 's/^([^ ]*) *(.*)/\2 <\1>/' |
    ifne dmenu -fn "$DEFAULT_FONT" -p "$DMENU_PROMPT_BOOKMARK" -l $DMENU_LINES -i $WINDOW_ARG | 
    sed -E 's/.*<([^ ]*)>$/\1/'

