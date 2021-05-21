#!/bin/sh

while true
do
    cat "/sys/class/tty/tty0/active"
    inotifywait -e modify "/sys/class/tty/tty0/active" 2> /dev/null
done

