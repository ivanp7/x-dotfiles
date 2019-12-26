#!/bin/sh

cd ~
while xhost > /dev/null 2>&1
do surf -w dropdown_browser
done

