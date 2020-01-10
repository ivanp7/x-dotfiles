#!/bin/sh

HISTORY_FILE="$HOME/.surf/history.txt"
REVERSE_HISTORY_FILE="$HOME/.surf/history.rev.txt"
NEW_REVERSE_HISTORY_FILE="$HOME/.surf/history.rev2.txt"
MAX_HISTORY_LENGTH=10000

tac "$HISTORY_FILE" > "$REVERSE_HISTORY_FILE"
awk '{print $3}' "$REVERSE_HISTORY_FILE" | sort | uniq | 
    xargs -r -I {} grep -m 1 "{}" "$REVERSE_HISTORY_FILE" > "$NEW_REVERSE_HISTORY_FILE"
tac "$NEW_REVERSE_HISTORY_FILE" > "$REVERSE_HISTORY_FILE"
tail -n $MAX_HISTORY_LENGTH "$REVERSE_HISTORY_FILE" > "$HISTORY_FILE"
rm "$REVERSE_HISTORY_FILE" "$NEW_REVERSE_HISTORY_FILE"

