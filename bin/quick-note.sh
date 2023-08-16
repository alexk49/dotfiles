#!/bin/bash

# set vim as default editor
EDITOR=vim; export EDITOR

NOTES_FOLDER="$HOME/notes"

ARCHIVE_FOLDER="$HOME/notes/archive"

previous_date=$(date -d "-1 month" "+%m%Y")

previous_quick_notes_file_path="$NOTES_FOLDER/notes_$previous_date.md"

if [[ -e "$previous_quick_notes_file_path" ]]; then
    echo "archiving: $previous_quick_notes_file_path"
    mv "$previous_quick_notes_file_path" "$ARCHIVE_FOLDER"
fi

current_date=$(date +"%m%Y")

quick_notes_file_path="$NOTES_FOLDER/notes_$current_date.md"

today=$(date +"%Y-%m-%d %T")

entry="# $today"

if [[ ! -e "$quick_notes_file_path" ]]; then
    echo "$entry" > "$quick_notes_file_path"
else
    sed -i "1s/^/$entry\n\n/" "$quick_notes_file_path"
fi

"$EDITOR" "$quick_notes_file_path"
