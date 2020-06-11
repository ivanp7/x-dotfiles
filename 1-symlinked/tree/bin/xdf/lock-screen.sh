#!/bin/sh

STATE=$(xssstate -s)
case "$1" in
    -on) xset s on ;;
    -off) xset s off ;;
    -*) [ "$STATE" = "disabled" ] && echo disabled || echo enabled ;;
    *) [ "$(xssstate -s)" != "disabled" ] && slock & $@
esac

