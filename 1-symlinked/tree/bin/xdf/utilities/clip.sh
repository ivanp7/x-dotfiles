#!/bin/sh

TARGET=""
[ -n "$1" ] && TARGET="-t $1"
exec xclip -selection clipboard $TARGET

