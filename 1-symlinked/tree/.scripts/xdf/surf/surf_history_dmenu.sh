#!/bin/sh

if [ -n "$1" ]; then WINDOW_ARG="-w $1"; fi
DMENU_PROMPT="${2:-History link}"

tac "$HOME/.surf/history.txt" | 
    dmenu -fn "$DEFAULT_FONT" -p "$DMENU_PROMPT" -l 10 -i $WINDOW_ARG | 
    cut -d' ' -f3

