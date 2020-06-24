#!/bin/sh

DEVICE=$([ -z "$1" ] && echo /dev/video0 || echo /dev/video$1)
[ -r "$DEVICE" ] && $PLAYER $DEVICE

