#!/bin/sh

while xhost > /dev/null 2>&1
do 
    polybar $1
done

