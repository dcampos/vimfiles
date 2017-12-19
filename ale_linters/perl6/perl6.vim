" Author: Darlan P. de Campos <darlanpedro@gmail.com>
" Description: perl6 linting for Perl6 files

call ale#Set('perl6_perl6_executable', 'perl6')
call ale#Set('perl6_perl6_options', '')
call ale#Set('perl6_perl6_use_global', 0)

let $RAKUDO_EXCEPTIONS_HANDLER='JSON'

function! ale_linters#perl6#perl6#GetExecutable(buffer) abort
    return ale#python#FindExecutable(a:buffer, 'perl6_perl6', ['perl6'])
endfunction

function! ale_linters#perl6#perl6#GetCommand(buffer) abort
    return ale#Escape(ale_linters#perl6#perl6#GetExecutable(a:buffer))
    \   . ' '
    \   . ale#Var(a:buffer, 'perl6_perl6_options')
    \   . ' -c -'
endfunction

function! ale_linters#perl6#perl6#Handle(buffer, lines) abort
    try
        let l:errors = json_decode(join(a:lines, ''))
    catch
        return []
    endtry

    if empty(l:errors)
        return []
    endif

    let l:output = []

    for l:error in values(l:errors)
        call add(l:output, {
        \   'lnum': l:error['line'],
        \   'text': l:error['message'],
        \   'col': len(l:error['pre']) + 1,
        \   'type': 'E',
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('perl6', {
\   'name': 'perl6',
\   'executable_callback': 'ale_linters#perl6#perl6#GetExecutable',
\   'command_callback': 'ale_linters#perl6#perl6#GetCommand',
\   'callback': 'ale_linters#perl6#perl6#Handle',
\   'output_stream': 'stderr',
\})
