#!/bin/sh

# kill animated wallpaper, if it is displayed
pkill xwinwrap

feh --no-fehbg --bg-scale "$1"

