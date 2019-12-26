#!/bin/sh

cd ~
while xhost > /dev/null 2>&1
do $TERMINAL -c dropdown_terminal -t "dropdown terminal"
done

