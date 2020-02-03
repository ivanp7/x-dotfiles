#!/bin/sh

while xhost > /dev/null 2>&1
do picom --config $HOME/.picom.conf
done

