#!/bin/sh

STATUS_FILE="/tmp/no-screen-lock_$USER"
case "$1" in
    -on) rm $STATUS_FILE ;;
    -off) touch $STATUS_FILE ;;
    -*) [ -f "$STATUS_FILE" ] && echo disabled || echo enabled ;;
    *) [ -f "$STATUS_FILE" ] || { xkb-switch -s us; slock; } & $@
esac

