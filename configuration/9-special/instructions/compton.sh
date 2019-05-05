#!/bin/sh

case $1 in
    i)
        install -Dm 644 /etc/xdg/compton.conf $HOME/.compton.conf
        sed -i "s/^vsync/# vsync/g" $HOME/.compton.conf
        ;;

    u)
        rm $HOME/.compton.conf
        ;;

    *)
        exit 1
esac

