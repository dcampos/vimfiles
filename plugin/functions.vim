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

" Toggle trailing white space highlighting
function! HighlightWhitespace()
    if g:ws_highlighting
        highlight link ExtraWhitespace NONE
        let g:ws_highlighting = 0
    else
        highlight link ExtraWhitespace Error
        match ExtraWhitespace /\s\+$/ 
        let g:ws_highlighting = 1
    endif
    echo 'White space highlighting toggled'
endfunction

" Remove trailing spaces
function! TrimWhitespace()
    %s/\s\+$//e
    echo 'White space removed'
endfunction

let g:ws_highlighting = 0

nnoremap <Plug>(toggle-highlight-whitespace) :call HighlightWhitespace()<CR>
nnoremap <Plug>(trim-whitespace) :call TrimWhitespace()<CR>

