#!/bin/sh

command -v unclutter > /dev/null || exit 1

while xhost > /dev/null 2>&1
do unclutter
done

