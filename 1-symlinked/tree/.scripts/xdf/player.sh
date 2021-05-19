#!/bin/sh

[ -f "$TMPDIR_CURRENT/x_desktop/$(cat /sys/class/tty/tty0/active)" ] &&
    exec mpv "$@" ||
    exec "$HOME/.scripts/df/player.sh" "$@"

