#!/bin/sh

[ "$(pidof emacs)" ] && emacsclient "$@" || emacs "$@"

