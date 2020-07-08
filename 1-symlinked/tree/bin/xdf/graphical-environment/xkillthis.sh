#!/bin/sh

ID=$(xdotool selectwindow 2> /dev/null)
[ -n "$ID" ] && xkill -id $ID

