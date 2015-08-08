let g:rooter_patterns = ['build.gradle', '.project', '.git/', '.hg/']

" Syntax highlighting
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150
let java_comment_strings=1

set synmaxcol=0

augroup kill_javavi
    auto!
    autocmd VimLeave *.* silent! call system('pkill -f kg.ash.javavi')
augroup end

