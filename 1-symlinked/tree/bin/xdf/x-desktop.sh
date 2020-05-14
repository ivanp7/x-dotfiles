#!/bin/sh

cd $HOME
startx "$XDG_CONFIG_HOME/X11/xinitrc" -- "$XDG_CONFIG_HOME/X11/xserverrc"

reset

