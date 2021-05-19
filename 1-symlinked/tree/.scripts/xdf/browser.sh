#!/bin/sh

[ -f "$TMPDIR_CURRENT/x_desktop/$(cat /sys/class/tty/tty0/active)" ] &&
    exec "$HOME/bin/xdf/applications/tabbed/tabbed-surf.sh" "$@" ||
    exec "$HOME/.scripts/df/browser.sh" "$@"

