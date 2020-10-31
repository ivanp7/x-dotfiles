#!/bin/sh

DMENU_PROMPT=Window
DMENU_LINES=10
DMENU_COLUMNS=2

WINDOW_ID=$(for id in $(bspc query -N -n .window.hidden)
do echo "$id: $(xdotool getwindowname $id)"
done | dmenu -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS | cut -d':' -f 1)

[ -z "$WINDOW_ID" ] && exit 0

bspc node $WINDOW_ID --flag hidden=off -f

