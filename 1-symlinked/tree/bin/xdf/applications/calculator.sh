#!/bin/sh

DMENU_PROMPT=Expression
DMENU_LINES=10
DMENU_COLUMNS=3

HISTORY_FILE=$XDG_CACHE_HOME/calculator-history

INPUT=$(tac "$HISTORY_FILE" | dmenu.sh -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS)
[ -z "$INPUT" ] && exit
RESULT=$(calc.sh "$INPUT")
[ -z "$RESULT" ] && exit 1

notify-send "Calculation result" "$RESULT"

{ grep -Fv "$INPUT" "$HISTORY_FILE"; echo "$INPUT"; } > "$HISTORY_FILE.new"
rm "$HISTORY_FILE"
mv "$HISTORY_FILE.new" "$HISTORY_FILE"

