#!/bin/bash

# set vim as default editor
EDITOR=vim; export EDITOR

NOTES_FOLDER="$HOME/notes/task-journal"

current_date=$(date +"%Y-%m-%d")

quick_notes_file_path="$NOTES_FOLDER/$current_date-notes.md"

today=$(date +"%Y-%m-%d %T")

entry="# $today"

if [[ ! -e "$quick_notes_file_path" ]]; then
    echo "$entry" > "$quick_notes_file_path"
else
    sed -i "1s/^/$entry\n\n/" "$quick_notes_file_path"
fi

"$EDITOR" "$quick_notes_file_path"
