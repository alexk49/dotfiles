# this sets makes vim commands usable on command line
set -o vi

#export TERM="screen-256color"
if [[ $TERM == xterm ]]; then
    TERM=xterm-256color
fi
# set vim as default editor
EDITOR=vim; export EDITOR

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# ignore duplicates in command history
export HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# sets the umask to solve issues with shared dirs
umask 0002

# =====
# paths
# ====

# install ruby gems to ~/gems
export GEM_HOME="$HOME/gems"

export PATH="$PATH:$HOME/bin:$HOME/scripts:$HOME/dotfiles/bin:$HOME/go/bin:$HOME/gems/bin"

# ===============
# todo.txt config
# ===============

source "$HOME/scripts/todo_completion"
export TODOTXT_DEFAULT_ACTION=ls
alias td="$HOME/scripts/todo.sh -d $HOME/dotfiles/todo.cfg"

# ============
# set aliases
# ============

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# clear screen
alias cls="clear"

# open files in their default program
alias open="xdg-open"

# navigation
alias ..="cd .."
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias .....="cd ../../../../"

# git aliases
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gb="git branch"
alias gd="git diff"

# view simple one line git log
alias gl="git log --oneline"

# view difference
alias gd="git diff"

# list hidden dirs
alias l.="ls -d .* --color=auto"

# shortcut for mousepad on xubuntu
alias mp="mousepad"

# short cuts for neovim
alias nv="nvim"
alias vi="vim"

# get path
alias gp="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection a"

# edit todo.txt file
alias etd="$EDITOR $HOME/notes/todo.txt"

# ===================
# aliases for scripts
# ===================

# howto script
alias ht="$HOME/repos/ht-cli/howto.sh"

# task journal script
alias tj="$HOME/repos/task-journal/task-journal.sh"

alias qn="$HOME/dotfiles/bin/quick-note.sh"

alias notes="cd $HOME/notes"

# =============
# set functions
# =============

docs () {
    docs_dir="$HOME/notes/docs"

    if [[ "$#" == 0 ]]; then
        # no additional args given just cd dir
        cd "$docs_dir"
    else
        # loop through passed on arguments as search
        search_query="$1"

        seperator='|'

        for arg in "$@"; do
            # if arg is first arg then do nothing
            if [[ "$arg" == "$search_query" ]]; then
                continue
            fi
            # concatenate search query with seperator and new query string
            search_query="$search_query$seperator$arg"
        done

        # /* after variable as otherwise it treats the /* as a literal path
        grep --color=auto -r -E "$search_query" "$docs_dir"/*
    fi
}

mcd () {
    # make and change directory
    # p switch makes parent directories if they don't exist
    # v gives verbosity
    mkdir -p -v "$1"
    cd "$1" || exit
}


hg () {
    # history grep
    # grep search through history
    history | grep "$1";
}


mrf () {
    # get most recent file from current dir
    find . -maxdepth 1 -not -type d -print0 | xargs -0 ls -t | head -n 1
}


fcd () {
    # find and change directory
    cd "$(find -type d | fzf)"
}


# =================
# set prompt string
# ================

# addded time and removed home machine name from prompt
PS1="\[\e[2;37m\](\A)\[\e[0m\] \[\e[01;32m\]\u\[\e[0m\]:\[\e[01;34m\]\w\[\e[0m\]$ "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
