" Detect current OS
" Source: http://unix.stackexchange.com/a/40370
function! MySys()
    if has("win32")
        return "win"
    endif
    if has("unix")
        if system('uname') =~ 'Darwin'
            return "mac"
        else
            return "linux"
        endif
    endif
endfunction

" Toggle trailing white space highlighting
function! HighlightWhitespace()
    if !exists('b:ws_highlighting')
        let b:ws_highlighting = 0
    end

    if b:ws_highlighting
        call DisableWhiteSpace()
    else
        call EnableWhiteSpace()
    endif
    echo 'White space highlighting toggled'
endfunction

function! DisableWhiteSpace()
    highlight link ExtraWhitespace NONE
    let b:ws_highlighting = 0
endfunction

function! EnableWhiteSpace()
    highlight link ExtraWhitespace Error
    match ExtraWhitespace /\s\+$/ 
    let b:ws_highlighting = 1
endfunction

" Remove trailing space
" Source: luciano-fiandesio/dotfiles
function! RemoveWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
    echo 'White space removed'
endfunction

nnoremap <Plug>(toggle-highlight-whitespace) :call HighlightWhitespace()<CR>
nnoremap <Plug>(remove-whitespace) :call RemoveWhitespace()<CR>

