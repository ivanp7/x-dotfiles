#!/bin/sh

DMENU_PROMPT="Man page"
DMENU_LINES=10
DMENU_COLUMNS=10

HISTORY_FILE=$XDG_CACHE_HOME/man-history
touch "$HISTORY_FILE"

INPUT=$(tac "$HISTORY_FILE" | uniq | dmenu -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS)
[ -z "$INPUT" ] && exit

tabbed-st.sh info_man -e man $INPUT

{ grep -Fv "$INPUT" "$HISTORY_FILE"; echo "$INPUT"; } | sponge "$HISTORY_FILE"

