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
        call <SID>DisableWhitespace()
    else
        call <SID>EnableWhitespace()
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

" Source: http://stackoverflow.com/q/1205286/
function! s:RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

command! -range=% RemoveWhitespace silent! :<line1>,<line2>s/\s\+$//e | normal! ``
command! ToggleWhitespace  :call <SID>ToggleWhitespace()
command! AutoToggleWS  :call <SID>AutoToggleWS()
command! EnableWhitespace  :call <SID>EnableWhitespace()
command! DisableWhitespace :call <SID>DisableWhitespace()
command! RenameFile :call <SID>RenameFile()

