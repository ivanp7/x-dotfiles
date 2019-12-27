#!/bin/sh

SURF_WINDOW="${1:-$(xprop -root | sed -n '/^_NET_ACTIVE_WINDOW/ s/.* //p')}"
DMENU_PROMPT="${2:-Bookmark}"

cat "$HOME/.surf/bookmarks.txt" $(find "$HOME/.surf/bookmarks/" -type f) | 
    sed -E 's/\s*".*//; /^\s*$/d' | sed -E 's/^([^ ]*) *(.*)/\2 <\1>/' |
    dmenu.sh -p "$DMENU_PROMPT" -l 10 -i -w $SURF_WINDOW | cut -d' ' -f1

