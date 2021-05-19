#!/bin/sh

[ -f "$TMPDIR_CURRENT/x_desktop/$(cat /sys/class/tty/tty0/active)" ] &&
    exec sxiv "$@" ||
    exec "$HOME/.scripts/df/viewer.sh" "$@"

