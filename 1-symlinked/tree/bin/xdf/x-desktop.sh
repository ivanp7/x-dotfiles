#!/bin/sh

# request display of shell info
PIDFILE="$TMPDIR_CURRENT/shell_info/$(tty)/$PARENT_SHELL_PID_EXPORTED"
[ -n "$PARENT_SHELL_PID_EXPORTED" -a -f "$PIDFILE" ] && rm "$PIDFILE" || true

mkdir -p "$TMPDIR/x_desktop"
touch "$TMPDIR/x_desktop/$(cat /sys/class/tty/tty0/active)"

cd; startx "$XDG_CONFIG_HOME/X11/xinitrc" -- "$XDG_CONFIG_HOME/X11/xserverrc"

rm "$TMPDIR/x_desktop/$(cat /sys/class/tty/tty0/active)"

