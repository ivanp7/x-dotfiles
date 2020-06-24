#!/bin/sh

if [ -z "$DEFAULT_FONT" ]
then DEFAULT_FONT="xos4 Terminus:size=10"
fi

sed -i 's/DEFAULT_FONT/'"$DEFAULT_FONT"'/g' $HOME/.config/polybar/config

