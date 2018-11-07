#!/bin/bash

mkdir -p $HOME/.tmux_tmp

TTY=$(tty | sed 's@/dev/@@; s@/@@')
touch $HOME/.tmux_tmp/$TTY

startx

rm $HOME/.tmux_tmp/$TTY

reset

