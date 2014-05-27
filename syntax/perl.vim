" Melhorias no destaque para Perl

" Only do this when not done yet for this buffer
if (exists("b:did_syntax"))
  finish
endif
let b:did_ftplugin = 1

" hi link perlSharpBang Special
" hi link perlMatch Constant
" hi link perlMatchStartEnd perlMatch
" hi link perlFunctionName Function
" hi link perlStatementSub Type
hi link perlVarPlain Type
hi link perlVarPlain2 Number

