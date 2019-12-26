#!/bin/sh

if [ -r "$HOME/.default_font" ]
then 
    FONT=$(cat $HOME/.default_font)
    dmenu_run -fn "$FONT" "$@"
else 
    dmenu_run -fn "$DEFAULT_FONT" "$@"
fi

