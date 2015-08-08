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

" Whitespace functions {{{

function! s:SetupWhitespace()
    if !exists('b:ws_enabled') && exists('g:ws_enabled')
        let b:ws_enabled = g:ws_enabled
    elseif !exists('b:ws_enabled')
        let b:ws_enabled = 0
    endif
endfunction

" Toggle trailing white space highlighting
function! s:ToggleWhitespace()
    if b:ws_enabled
        let b:ws_enabled = 0
        call <SID>HideWhitespace()
    else
        let b:ws_enabled = 1
        call <SID>ShowWhitespace()
    endif
endfunction

function! s:HideWhitespace()
    highlight link ExtraWhitespace NONE
endfunction

function! s:ShowWhitespace()
    if b:ws_enabled
        highlight link ExtraWhitespace Error
        match ExtraWhitespace /\s\+$/
    endif
endfunction

function! s:DisableWhitespace()
    let b:ws_enabled = 0
endfunction

function! s:EnableWhitespace()
    let b:ws_enabled = 1
endfunction

" }}}

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

" Install cpan module
function! s:Cpanm(...)
    if len(a:000) > 0
        exec ':!cpanm --sudo ' . join(a:000, ' ')
    elseif expand('<cword>') != ''
        exec ':!cpanm --sudo <cword>'
    endif
endfunction

function! s:RooterLeave()
    let b:rooter_called = 0
endfunction

function! s:RooterEnter(bang)
    if !exists('b:rooter_called')
        let b:rooter_called = 0
    endif

    if !b:rooter_called || a:bang
        Rooter
        let b:rooter_called = 1
    endif
endfunction

" Load Java classpath
function! s:LoadClasspath()
    RooterEnter!
    let filename = 'classpath.txt'
    if file_readable(filename)
        let g:my_java_classpath = join(readfile(filename), '')
    else
        let g:my_java_classpath = ''
    endif
    return g:my_java_classpath
endfunction

command! -range=% RemoveWhitespace silent! <line1>,<line2>s/\s\+$//e | normal! ``
command! ToggleWhitespace  call <SID>ToggleWhitespace()
command! ShowWhitespace  call <SID>ShowWhitespace()
command! HideWhitespace call <SID>HideWhitespace()
command! EnableWhitespace call <SID>EnableWhitespace()
command! DisableWhitespace call <SID>DisableWhitespace()
command! SetupWhitespace call <SID>SetupWhitespace()
command! RenameFile call <SID>RenameFile()
command! -nargs=* Cpanm call <SID>Cpanm(<f-args>)
command! -bar LoadClasspath call <SID>LoadClasspath()
command! -bar -bang RooterEnter call <SID>RooterEnter(<bang>0)
command! -bar RooterLeave call <SID>RooterLeave()

" vim:fdm=marker
