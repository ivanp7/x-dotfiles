#!/bin/sh

DIR="/tmp/tmux-refresh-service-$(whoami)"

mkdir -p $DIR

TTY=$(tty | sed 's,/dev/,,; s,/,,')
touch $DIR/$TTY

cd $HOME
startx

rm $DIR/$TTY

reset

