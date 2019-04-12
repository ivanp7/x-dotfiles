#!/bin/sh

CONF_DIR=$(realpath `dirname $0`)

mkdir -p $HOME/bin/
[ ! -L "$HOME/bin/xdf" ] && ln -sf $CONF_DIR/scripts $HOME/bin/xdf

ln -sf $HOME/bin/xdf/x-desktop.sh $HOME/bin/

