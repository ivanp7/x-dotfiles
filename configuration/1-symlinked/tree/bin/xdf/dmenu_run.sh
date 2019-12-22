#!/bin/sh

if [ -r "$HOME/.default_font" ]
then cat $HOME/.default_font | xargs -I {} dmenu_run -fn "{}" "$@"
else dmenu_run -fn "$DEFAULT_FONT" "$@"
fi

