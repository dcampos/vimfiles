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
function! s:ToggleWhitespace()
    if !exists('b:ws_highlighting')
        let b:ws_highlighting = 0
    end

    if b:ws_highlighting
        call DisableWhiteSpace()
    else
        call EnableWhiteSpace()
    endif
endfunction

function! s:DisableWhitespace()
    highlight link ExtraWhitespace NONE
    let b:ws_highlighting = 0
endfunction

function! s:EnableWhitespace()
    highlight link ExtraWhitespace Error
    match ExtraWhitespace /\s\+$/
    let b:ws_highlighting = 1
endfunction

command! -range=% RemoveWhitespace silent! :<line1>,<line2>s/\s\+$//e | normal! ``
command! ToggleWhitespace  :call <SID>HighlightWhitespace()
command! EnableWhitespace  :call <SID>EnableWhitespace()
command! DisableWhitespace :call <SID>DisableWhitespace()

