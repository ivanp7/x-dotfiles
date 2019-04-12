#!/bin/sh

# LAYOUT
# ==========

sleep 1

# Construct user layout
SCRIPT=$HOME/bin/layout/load-layout.sh
[ -f $SCRIPT ] && sh $SCRIPT

