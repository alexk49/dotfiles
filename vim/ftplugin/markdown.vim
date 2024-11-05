setlocal spell
highlight clear SpellBad
highlight SpellBad term=underline cterm=underline gui=underline

" display the rendered markdown in your browser
if executable('grip')
  nnoremap <buffer><space>m :Dispatch grip --pass $GRIP -b %<cr>
endif
