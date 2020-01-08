#!/bin/sh

DMENU_PROMPT="${1:-Bookmark}"

cat $(find "$HOME/.bookmarks/" -type f) | 
    sed -E 's/\s*".*//; /^\s*$/d' | sed -E 's/^([^ ]*) *(.*)/\2 <\1>/' |
    dmenu.sh -p "$DMENU_PROMPT" -l 10 -i | sed -E 's/.*<([^ ]*)>$/\1/' | 
    xclip -i -selection clipboard

