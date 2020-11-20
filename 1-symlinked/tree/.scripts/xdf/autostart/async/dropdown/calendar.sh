#!/bin/sh

while xhost > /dev/null 2>&1
do 
    st -c dropdown_calendar -t "dropdown calendar" -e sh -c 'while true; do cal -3; sleep 1; clear; done' > /dev/null 2>&1
done

