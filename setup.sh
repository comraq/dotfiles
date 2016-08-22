#!/bin/sh

ABSPATH=$(readlink -f "$0")
BASEDIR=$(dirname "$ABSPATH")

dotfiles="$BASEDIR/files"

# Loops through the dotfiles in the 'files' directory
# - creates sym link for each in '$HOME/'
#
# - backups currently existing '.filename' if it exists and is a regular
#   file
# - backups are stored in the 'backup/' directory
for file in "$dotfiles"/*; do
  filename="${file##*/}"
  if [ -f "$HOME/.$filename" ]; then
    cp -f "$HOME/.$filename" "$BASEDIR/backup/"
  fi

  ln -sf "$file" "$HOME/.$filename"
done
