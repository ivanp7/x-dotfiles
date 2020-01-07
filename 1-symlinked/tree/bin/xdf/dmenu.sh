#!/bin/sh

if [ -r "$HOME/.default_font" ]
then 
    FONT=$(cat $HOME/.default_font)
    dmenu -fn "$FONT" "$@"
else 
    dmenu -fn "$DEFAULT_FONT" "$@"
fi

