#!/bin/bash

# get random task from todo.txt file

TODO_FILE="$HOME/notes/todo.txt"

cat "$TODO_FILE" | shuf -n 1
