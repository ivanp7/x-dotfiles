#!/bin/sh

SURF_WINDOW="${1:-$(xprop -root | sed -n '/^_NET_ACTIVE_WINDOW/ s/.* //p')}"
DMENU_PROMPT="${2:-History link}"

tac "$HOME/.surf/history.txt" | 
    dmenu.sh -p "$DMENU_PROMPT" -l 10 -i -w $SURF_WINDOW | cut -d' ' -f3

