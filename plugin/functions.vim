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
" luciano-fiandesio/dotfiles
function! RemoveWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
    echo 'White space removed'
endfunction

let g:ws_highlighting = 0

nnoremap <Plug>(toggle-highlight-whitespace) :call HighlightWhitespace()<CR>
nnoremap <Plug>(remove-whitespace) :call RemoveWhitespace()<CR>

