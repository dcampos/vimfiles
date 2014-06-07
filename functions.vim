if exists('g:loaded_functions')
    finish
endif
let g:loaded_functions = 1

function! MySys()
    if has("win32")
        return "win"
    endif
    if has("unix")
        if system('uname')=~'Darwin'
            return "mac"
        else
            return "Linux"
        endif
    endif
endfunction

