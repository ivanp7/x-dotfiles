#!/bin/bash

i3-msg "restart"
sleep 1.0
[ -x ~/layout/reload-layout.sh ] && ~/layout/reload-layout.sh

