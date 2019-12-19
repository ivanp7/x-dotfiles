#!/bin/sh

if [ -r "$HOME/.default_font" ]
then cat $HOME/.default_font | xargs -I font dmenu_run -fn "font"
else dmenu_run -fn "xos4 Terminus:size=10"
fi

