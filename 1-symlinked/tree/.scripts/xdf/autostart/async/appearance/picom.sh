#!/bin/sh

command -v picom > /dev/null || exit 1

while xhost > /dev/null 2>&1
do picom --config $XDG_CONFIG_HOME/picom/picom.conf --experimental-backends
done

