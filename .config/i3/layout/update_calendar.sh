#!/bin/bash

when ci
while true
do
    inotifywait -qq -e delete_self -e close_write $HOME/Org/calendar
    clear
    when ci
done

