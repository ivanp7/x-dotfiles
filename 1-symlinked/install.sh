#!/bin/sh

CONF_DIR="$(realpath "$(dirname "$0")")"
UNINST_SCRIPT=$1

INTERMEDIATE_SYMLINK="$HOME/.config/x-dotfiles"

[ -d "$CONF_DIR/tree" ] || exit 0

install ()
{
    mkdir -p "$HOME/$(dirname $1)"
    ln -sfT "$INTERMEDIATE_SYMLINK/$1" "$HOME/$1"

    [ -n "$UNINST_SCRIPT" ] && echo 'delete_symlink "'"$HOME/$1"'"' >> $UNINST_SCRIPT
}

add_directory_instruction ()
{
    [ -n "$UNINST_SCRIPT" ] && echo 'delete_empty_directory "'"$HOME/$1"'"' >> $UNINST_SCRIPT
}

[ -n "$UNINST_SCRIPT" ] &&
echo '
delete_symlink ()
{
    [ -L "$1" ] && rm -f "$1"
}
' >> $UNINST_SCRIPT

ln -sfT "$CONF_DIR/tree" "$INTERMEDIATE_SYMLINK"

DIRECTORIES=
[ -f "$CONF_DIR/directories" ] && 
    DIRECTORIES="$(sed 's,^,-path ./,; s,$, -prune -o ,' "$CONF_DIR/directories" | tr -d '\n')"

for file in $(cd "$CONF_DIR/tree"; find . $DIRECTORIES -type f | sort | sed 's,^\./,,')
do install $file; done

[ -n "$UNINST_SCRIPT" ] && echo >> $UNINST_SCRIPT

for dir in $(cd "$CONF_DIR/tree"; find . $DIRECTORIES -type f | xargs -r dirname | 
    sort | uniq | sed '/^\.$/d; s,^\./,,')
do add_directory_instruction "$dir"; done

