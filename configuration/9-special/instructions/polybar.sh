#!/bin/sh

case $1 in
    i)
        if [ -r "$HOME/.default_font" ]
        then cat $HOME/.default_font | xargs -I {} sed -i 's/DEFAULT_FONT/{}/g' $HOME/.config/polybar/config
        else sed -i 's/DEFAULT_FONT/xos4 Terminus:size=10/g' $HOME/.config/polybar/config
        fi

        ip link | grep -E '^[[:digit:]]*: *en.*:' | sed -E 's/^(.*): *(.*): (.*)/\2/' | head -n1 | xargs -I {} sed -i 's/WIRED_NETWORK_INTERFACE/{}/g' $HOME/.config/polybar/config
        ip link | grep -E '^[[:digit:]]*: *wl.*:' | sed -E 's/^(.*): *(.*): (.*)/\2/' | head -n1 | xargs -I {} sed -i 's/WIRELESS_NETWORK_INTERFACE/{}/g' $HOME/.config/polybar/config
        ;;

    u)
        ;;

    *)
        exit 1
esac
