#!/bin/bash

# set vim as default editor
EDITOR=vim; export EDITOR

NOTES_FOLDER="$HOME/notes"

quick_notes_file_path="$NOTES_FOLDER/QuickNote.md"

"$EDITOR" "$quick_notes_file_path"
