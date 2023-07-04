# p switch makes parent directories if they don't exist
# v gives verbosity
mcd () {
    mkdir -p -v "$1"
    cd "$1" || exit 
}


# grep search through history
hg () {
    history | grep "$1";
}


# get most recent file from current dir
mrf () {
    find . -maxdepth 1 -not -type d -print0 | xargs -0 ls -t | head -n 1
}

# find and change directory
fcd () {
    cd "$(find -type d | fzf)"
}
