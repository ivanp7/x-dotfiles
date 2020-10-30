#!/bin/sh

xkb-switch -s us
exec dmenu "$@"

