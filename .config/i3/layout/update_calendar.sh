#!/bin/bash

TASK="sh $HOME/.config/i3/layout/update_calendar_midnight.sh"
for job in `atq | awk '{print $1}'`
do
    at -c $job | fgrep $TASK > /dev/null && TASK_EXISTS=yes; break
done
[[ -z $TASK_EXISTS ]] && echo $TASK | at midnight > /dev/null 2>&1

##################################################################

when ci
while true
do
    inotifywait -qq -e delete_self -e close_write $HOME/Org/calendar
    clear
    when ci
done

