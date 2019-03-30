#!/bin/bash

mkdir -p /tmp/tmux-refresh-service-$(whoami)

TTY=$(tty | sed 's@/dev/@@; s@/@@')
touch /tmp/tmux-refresh-service-$(whoami)/$TTY

startx

rm /tmp/tmux-refresh-service-$(whoami)/$TTY

reset

