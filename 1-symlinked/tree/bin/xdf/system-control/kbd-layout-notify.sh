#!/bin/sh

[ "$#" -gt 0 ] && kbd-layout.sh "$@"
notify-send -t 500 -u normal "English layout" "$(kbd-layout.sh | tr '[:lower:]' '[:upper:]')"

