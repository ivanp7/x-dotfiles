#!/bin/sh

xdpyinfo | grep dimensions: | sed -E 's/[^0-9]*([^ ]+).*/\1/'

