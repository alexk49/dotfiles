" emmet config
" https://github.com/mattn/emmet-vim

" only enable for html and css files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" this allows ,, to execute emmet commands
" default is ctrl y followed by ,
let g:user_emmet_leader_key=','
