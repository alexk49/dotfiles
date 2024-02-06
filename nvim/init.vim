set runtimepath+=~/dotfiles/vim runtimepath+=~/dotfiles/vim/after
let &packpath=&runtimepath
source $HOME/dotfiles/vim/vimrc

" load lua init in /lua dir
lua require("init")
