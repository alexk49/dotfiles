cabbrev <expr> zm getcmdtype() ==# ':' && getcmdline() ==# 'zm' ? 'Goyo' : 'zm'

let s:ZenModeState=1

function! ToggleZenMode()
    if s:ZenModeState
        execute ':Goyo'
        let s:ZenModeState=0
    else
        execute ':Goyo!'
        let s:ZenModeState=1
    endif

endfunction

nnoremap <leader>z :call ToggleZenMode()<return>
