#!/bin/bash

# script to create sym links for dotfiles
# and move existing dotfiles to /backup dir

backup_dir="$HOME/backup"

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

new_vim_folder="$dotfiles_dir/vim"

if [[ -d "$org_vim_folder" ]]; then
    echo "vim folder already exists"
    check_backup_dir
    echo
    mv -v --backup=t "$org_vim_folder" "$backup_dir"
else
    echo "vim folder does not exist"
fi

echo
ln -vs "$new_vim_folder" "$org_vim_folder"

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
    
    echo
    ln -vs "$new_vim_folder" "$windows_vim_folder"
fi
