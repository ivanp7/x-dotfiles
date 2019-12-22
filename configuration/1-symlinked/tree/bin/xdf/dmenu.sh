#!/bin/sh

if [ -r "$HOME/.default_font" ]
then cat $HOME/.default_font | xargs -I {} dmenu -fn "{}" "$@"
else dmenu -fn "$DEFAULT_FONT" "$@"
fi

