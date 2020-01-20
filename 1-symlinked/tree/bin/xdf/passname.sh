#!/bin/sh

PASSWORD_STORE=$HOME/.password-store

DMENU_PROMPT=Password
DMENU_LINES=10

cd $PASSWORD_STORE
find . -path "./.git" -prune -o -type f \! -name ".gitignore" \
    \! -name ".gitattributes" \! -name ".gpg-id" -print |
    sed 's@^\./@@; s@\.gpg@@' |
    dmenu -fn "$DEFAULT_FONT" -p "$DMENU_PROMPT" -l $DMENU_LINES | 
    xclip -i -sel clip

