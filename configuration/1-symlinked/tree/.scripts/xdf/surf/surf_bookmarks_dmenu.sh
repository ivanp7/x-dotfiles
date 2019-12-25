#!/bin/sh

SURF_WINDOW="${1:-$(xprop -root | sed -n '/^_NET_ACTIVE_WINDOW/ s/.* //p')}"
DMENU_PROMPT="${2:-Bookmark}"

tac "$HOME/.surf/bookmarks.txt" | 
    dmenu.sh -p "$DMENU_PROMPT" -l 10 -i -w $SURF_WINDOW | cut -d' ' -f1

