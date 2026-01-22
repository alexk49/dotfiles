#!/bin/bash

# script to create sym links for dotfiles
# and move existing dotfiles to /backup dir

backup_dir="$HOME/backups"

check_backup_dir () {
    if [[ -d "$backup_dir" ]]; then
        echo "$backup_dir exists"
        return 0
    else
        echo "$backup_dir does not exist"
        mkdir -v "$backup_dir"
        return 0
    fi
}

dotfiles_dir="$HOME/dotfiles"

declare -a dotfiles=(".bashrc"
          ".gitconfig"
          ".gitignore"
          ".inputrc"
          ".tmux.conf"
          ".pythonrc.py"
)

# check if files exist and create .bak if they do
for file in "${dotfiles[@]}"; do
    org_file_path="$HOME/$file"

    new_file_path="$dotfiles_dir/$file"

    if [[ -e "$org_file_path" ]]; then
        echo "$file already exists"
        check_backup_dir
        echo
        mv -v --backup=t "$org_file_path" "$backup_dir"
    else
        echo "$file does not exist"
    fi

    ln -vs "$new_file_path" "$org_file_path"
done

# set .vim folder ln

org_vim_folder="$HOME/.vim"
windows_vim_folder="$HOME/vimfiles"

org_nvim_folder="$HOME/.config/nvim"
windows_nvim_folder="$HOME/AppData/Local/nvim"

new_vim_folder="$dotfiles_dir/vim"

new_nvim_folder="$dotfiles_dir/nvim"

if [[ -d "$org_vim_folder" ]]; then
    echo "vim folder already exists"
    check_backup_dir
    echo
    mv -v --backup=t "$org_vim_folder" "$backup_dir"
else
    echo "vim folder does not exist"
fi

if [[ -d "$org_nvim_folder" ]]; then
    echo "nvim folder already exists"
    check_backup_dir
    echo
    mv -v --backup=t "$org_nvim_folder" "$backup_dir"
else
    echo "nvim folder does not exist"
fi

echo

ln -vs "$new_vim_folder" "$org_vim_folder"
ln -vs "$new_nvim_folder" "$org_nvim_folder"

# check if running windows
if [[ "$OSTYPE" != "linux-gnu" ]]; then
    if [[ -d "$windows_vim_folder" ]]; then
        echo "vim windows folder exists"
        check_backup_dir
        echo
        mv -v --backup=t "$windows_vim_folder" "$backup_dir"
    else
        echo "windows vim folder does not exist"
    fi

    if [[ -d "$windows_nvim_folder" ]]; then
        echo "nvim windows folder exists"
        check_backup_dir
        echo
        mv -v --backup=t "$windows_nvim_folder" "$backup_dir"
    fi
    echo
    ln -vs "$new_vim_folder" "$windows_vim_folder"
    ln -vs "$new_nvim_folder" "$windows_nvim_folder"
fi

# set up tmux package manager
if [[ ! -e ~/.tmux/plugins/tmp ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [[ ! -e "$HOME/scripts/todo.sh" ]]; then

    mkdir -p "$HOME/scripts"

    wget -O "$HOME/scripts/todo_completion" \
        https://raw.githubusercontent.com/todotxt/todo.txt-cli/master/todo_completion

    wget -O "$HOME/scripts/todo.sh" \
        https://raw.githubusercontent.com/todotxt/todo.txt-cli/master/todo.sh

    chmod +x "$HOME/scripts/todo_completion" "$HOME/scripts/todo.sh"
fi
