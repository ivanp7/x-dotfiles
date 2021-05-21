#!/bin/sh

TTY_DISPLAY_FILE="$TMPDIR/x_desktop/$(cat "/sys/class/tty/tty0/active")"

[ -f "$TTY_DISPLAY_FILE" ] &&
    { export DISPLAY="$(cat "$TTY_DISPLAY_FILE")"; exec "$HOME/bin/xdf/applications/tabbed/tabbed-surf.sh" "$@"; } ||
    exec "$HOME/.scripts/df/browser.sh" "$@"

