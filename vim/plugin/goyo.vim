" plugin settings for goyo
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
