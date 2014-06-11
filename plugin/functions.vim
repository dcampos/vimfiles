" Detect current OS
" Source: http://unix.stackexchange.com/a/40370
function! MySys()
    if has("win32")
        return "win"
    endif
    if has("unix")
        if system('uname')=~'Darwin'
            return "mac"
        else
            return "linux"
        endif
    endif
endfunction

