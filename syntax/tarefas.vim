" Vim syntax file

" Maintainer:	Darlan de Campos
" Last Change:	2008 Jan 15

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

hi link tarefasTexto String
hi link tarefasData	Statement
hi link tarefasSetor Normal
hi link tarefaConcluida Comment

" Elementos das tarefas
syn match tarefasTexto "[^:]*$"
syn match tarefasData "^[^ ]\+"
syn match tarefasSetor " +[^:]\+:"
syn match tarefaConcluida "^.*OK *$"
