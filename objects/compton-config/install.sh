#!/bin/sh

CONF_DIR=$(realpath `dirname $0`)

install -Dm 644 /etc/xdg/compton.conf $HOME/.compton.conf
sed -i "s/^vsync/# vsync/g" $HOME/.compton.conf

