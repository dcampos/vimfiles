" Vim syntax file

" Maintainer:	Darlan de Campos
" Last Change:	2008 Jan 15

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

hi link url Underlined
hi link topico1 Identifier
hi link titulo Type
hi link tarefaConcluida Comment

" Elementos das tarefas - a ordem é importante
syn match url "http[^ ]\+"
syn match topico1 " *\*.*$"
syn match titulo "^\[.*\]$"
syn match tarefaConcluida "^.*OK *$"
