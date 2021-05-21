#!/bin/sh

TTY_DISPLAY_FILE="$TMPDIR/x_desktop/$(cat "/sys/class/tty/tty0/active")"

[ -f "$TTY_DISPLAY_FILE" ] &&
    { export DISPLAY="$(cat "$TTY_DISPLAY_FILE")"; exec zathura "$@"; } ||
    exec "$HOME/.scripts/df/pdfviewer.sh" "$@"

