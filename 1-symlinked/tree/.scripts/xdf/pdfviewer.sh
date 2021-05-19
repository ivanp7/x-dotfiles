#!/bin/sh

[ -f "$TMPDIR_CURRENT/x_desktop/$(cat /sys/class/tty/tty0/active)" ] &&
    exec zathura "$@" ||
    exec "$HOME/.scripts/df/pdfviewer.sh" "$@"

