#!/bin/sh

DMENU_PROMPT=Word
DMENU_LINES=10
DMENU_COLUMNS=10

HISTORY_FILE="$SDCV_HISTFILE"
touch "$HISTORY_FILE"

INPUT=$(tac "$HISTORY_FILE" | uniq | dmenu -p "$DMENU_PROMPT" -l $DMENU_LINES -g $DMENU_COLUMNS | head -1)
[ -z "$INPUT" ] && exit

OUTPUT_FILE=$(mktemp -p /tmp dictionary.XXXXXXXX)
dict.sh -n "$INPUT" > "$OUTPUT_FILE"

exec tabbed-st.sh info_dictionary -t "dictionary" -e less -mr "$OUTPUT_FILE"

