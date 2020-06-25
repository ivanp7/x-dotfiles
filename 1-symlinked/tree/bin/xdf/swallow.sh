#!/bin/sh

WID=$(bspc query -N -n focused)
bspc node $WID -g hidden

"$@"

bspc node $WID -g hidden -f

