#!/bin/sh

[ -z "$DEFAULT_FONT" ] && DEFAULT_FONT="xos4 Terminus:size=10"

sed -i 's/DEFAULT_FONT/'"$DEFAULT_FONT"'/g' $HOME/.config/polybar/config

