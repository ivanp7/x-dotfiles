#!/bin/bash

amixer -q -M sset Headphone 100% unmute
amixer -q -M sset Speaker 100% unmute
amixer -q -M sset PCM 100% unmute

if [[ -n $1 ]]; then 
    amixer -q -M sset Master $1 
fi

# LEFT_VOL=$(amixer get PCM -M | grep 'Front Left:' | cut -d ' ' -f7,9 | tr -d [])
# RIGHT_VOL=$(amixer get PCM -M | grep 'Front Right:' | cut -d ' ' -f7,9 | tr -d [])
VOL=$(amixer get Master -M | grep 'Mono:' | cut -d ' ' -f6,8 | tr -d [])
notify-send -t 1000 -u low "$(echo Volume: [$VOL])"

