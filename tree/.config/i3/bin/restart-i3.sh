#!/bin/bash

i3-msg "restart"
sleep 1.0
[ -f $HOME/layout/reload-layout.sh ] && . $HOME/layout/reload-layout.sh

