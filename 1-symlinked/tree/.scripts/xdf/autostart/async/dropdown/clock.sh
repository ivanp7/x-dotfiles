#!/bin/sh

command -v tty-clock > /dev/null || exit 1

while xhost > /dev/null 2>&1
do
    st -c dropdown_clock -t "dropdown clock" -e sh -c 'tty-clock -scDC 7' > /dev/null 2>&1
done

