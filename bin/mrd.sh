#!/bin/bash

# get most recent file out of download folder
# and open in vim

# set vim as default editor
EDITOR=vim; export EDITOR

DOWNLOADS_DIR="$HOME/Downloads"

cd "$DOWNLOADS_DIR"

file=$(ls -t "$DOWNLOADS_DIR" | head -n 1)

"$EDITOR" "$file"
