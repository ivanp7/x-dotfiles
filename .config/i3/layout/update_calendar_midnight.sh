#!/bin/bash

{ type xhost >& /dev/null && xhost >& /dev/null; } || exit

echo -n "" >> $HOME/Org/calendar
echo "sh $0" | at midnight > /dev/null 2>&1

