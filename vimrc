" Maintainer: Darlan de Campos <darlanpedro (a) gmail com>
" License: Public Domain


""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Opções básicas
"
""""""""""""""""""""""""""""""""""""""""""""""""""


set nocompatible

" Nenhum aviso visual
set visualbell

set number
set linebreak

" Correção ortográfica
set spelllang=pt
set spellfile=~/vim_local/spell.pt.latin1.add

" Recuo de texto
set tabstop=4
set shiftwidth=4
set noautoindent
set smartindent
set expandtab

set backspace=eol,start,indent

set nobackup
set noswapfile

set history=50

set ignorecase smartcase

set incsearch

" Interface
set background=dark
"set cursorline
syntax on
filetype plugin on

" Linha de status
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=\ %{getcwd()}                " current directory
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Menu para completar comandos
set wildmenu

" Usar área de transferência como padrão
set clipboard=unnamed

" Codificação do texto
set encoding=iso88591

" Adiciona _ à iskeyword
set iskeyword+=_


""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Mapeamentos
"
""""""""""""""""""""""""""""""""""""""""""""""""""


" Inserir linhas e continuar em modo normal
map ,o o<ESC>:echo<CR>
map ,O O<ESC>:echo<CR>

" Isto é para a lista de tags
let Tlist_Inc_Winwidth = 0
map <F3> :Tlist<CR>
map <F2> :NERDTreeToggle<CR>

" maps the word completion to the TAB key
"function InsertTabWrapper()
"      let col = col('.') - 1
"      if !col || getline('.')[col - 1] !~ '\k'
"          return "\<tab>"
"      else
"          return "\<c-p>"
"      endif
"endfunction 
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Ctrl+espaço mapeado para omnicompletion
imap <C-Space> <C-X><C-O> 

"map <F4> :w<CR>:!javac %<CR>
"map <F5> :!java %:r<CR>
map <F6> :%s/^\t*\s*$//g<CR>

" To save, press ctrl-s.
"nmap <c-s> :w<CR>
"imap <c-s> <Esc>:w<CR>a

" Barra de espaço/backspace mapeados para PageDown/PageUp no modo de comandos
noremap <Space> 
noremap <BS> 

" Abas
noremap <C-Tab> :tabnext<CR>     " Próxima aba
noremap <Leader>tc :tabclose<CR> " Fechar aba

" Salva/recarrega sessão
nmap <c-q>s :mksession! ~/vim_local/session<cr>
nmap <c-q>r :source ~/vim_local/session<cr>

" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p

" Insere data e hora atual
nnoremap <c-f5> "=strftime("%d/%m/%y %T")<cr>P

" Abre arquivo de tarefas
if MySys() == "windows"
    nnoremap <F4> :tabe ~/útil/tarefas.txt<cr>
endif

" Remover endentação
imap <S-Tab> <C-o><<


""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Abreviações
"
""""""""""""""""""""""""""""""""""""""""""""""""""


" Evitar erros ao salvar/sair
cab W w| cab Q q| cab Wq wq| cab wQ wq| cab WQ wq


""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Diversos/auto-comandos
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" Perl
" Isto é para o perldoc.vim
autocmd BufNewFile,BufRead *.p{l,m} setf perl
if MySys() == "linux"
    autocmd BufNewFile,BufRead *.p{l,m} map <F1> :Perldoc<cword><CR>
    autocmd BufNewFile,BufRead *.p{l,m} let g:perldoc_program='/usr/bin/perldoc'
    autocmd BufNewFile,BufRead *.p{l,m} source ~/vim_local/ftplugin/perl_doc.vim
endif
" Use o compilador do Perl para todos os arquivos com extensão *.pl e *.pm
autocmd BufNewFile,BufRead *.p{l,m} compiler perl

" Python
" Use o compilador Python para todos os arquivos com extensão *.py
autocmd BufNewFile,BufRead *.py compiler python

" Java
autocmd BufNewFile,BufRead *.java set omnifunc=javacomplete#Complete

" Ruby
" Compilador
autocmd BufNewFile,BufRead *.rb compiler ruby
" Recuo de texto
autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 shiftwidth=2

" Arquivos tt2: tratar como html
au BufNewFile,BufRead *.tt2 set ft=html

" Muda para o diretório do arquivo atual
autocmd BufEnter * lcd %:p:h

" Inserir modelo quando iniciar novo arquivo
augroup templates
    au!
    " read in template files
    autocmd BufNewFile *.* silent! execute '0r ~/vim_local/templates/template.'.expand("<afile>:e")
    
    " parse special text in the templates after the read
    autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END

autocmd BufNewFile,BufRead *.java source ~/vim_local/JavaRun.vim

" Cada arquivo em uma nova aba - causa alguns erros
"au BufAdd,BufNewFile * nested tab sball

" Omnicomplete
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
    set columns=100 lines=40
    set guioptions-=T                  " -toolbar
    if MySys() == "windows"
        set bg=light
        colors rootwater
        set guifont=Dejavu\ Sans\ mono 
    elseif MySys() == "linux"
        set bg=dark
        colors wombat
        set guifont=Liberation\ mono
    endif
else
    colors ron 
endif

autocmd BufNewFile,BufRead *.tt set ft=html

