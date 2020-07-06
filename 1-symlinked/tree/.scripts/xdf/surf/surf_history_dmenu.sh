#!/bin/sh

[ -n "$1" ] && WINDOW_ARG="-w $1"
DMENU_PROMPT="${2:-History link}"

tac "$XDG_CONFIG_HOME/.config/surf/history.txt" | 
    dmenu -fn "$DEFAULT_FONT" -p "$DMENU_PROMPT" -l 10 -i $WINDOW_ARG | 
    cut -d' ' -f3

