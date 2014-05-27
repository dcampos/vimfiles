" Maintainer: Darlan P. de Campos <darlanpedro (a) gmail com>
" License: Public Domain


" VUNDLE {{{

set nocompatible

filetype off

" set the runtime path to include Vundle and initialize

call vundle#rc(g:home_prefix . "/vim_local/bundle/")

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
"Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
" Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-perl/vim-perl'
Plugin 'c9s/perlomni.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/ctrlp.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
" Plugin 'chriskempson/base16-vim'

" Requisito: Python
if MySys() == "linux"
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
endif

" Plugin 'drmingdrmer/xptemplate'
" Plugin 'ludovicchabant/vim-lawrencium'

" http://www.lucianofiandesio.com/vim-configuration-for-happy-java-coding
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-rooter'

" Plugin 'Valloric/YouCompleteMe'

" Plugin 'Marslo/EnhCommentify.vim'
Plugin 'tomtom/tcomment_vim'

"Plugin 'sentientmachine/erics_vim_syntax_and_color_highlighting'
"Plugin 'tpope/vim-rails.git'

" Plugin 'flazz/vim-colorschemes'

" Repositórios pessoais/forks
Plugin 'dcampos/vim-aldmeris'
Plugin 'dcampos/proguard.vim'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
"Plugin 'FuzzyFinder'
Plugin 'ack.vim'
" Plugin 'SingleCompile'
" Plugin 'TagHighlight'

" scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

" call vundle#end()             " required (?)
filetype plugin indent on     " required

" To ignore plugin indent changes, instead use:
"filetype plugin on


" END VUNDLE }}}


" DEFINIÇÕES {{{

" Mapleader: configura a tecla <leader>.
let mapleader = ","
let g:mapleader = ","

nnoremap ,, ,
vnoremap ,, ,

" Nenhum aviso visual
set visualbell

set noerrorbells

" Números de linhas
set number
set linebreak

" Correção ortográfica
set spelllang=pt
set spellfile=~/vim_local/spell.pt.latin1.add

" Recuo de texto
set tabstop=4
set shiftwidth=4
set expandtab               " Expandir <tab> para espaços equivalentes
set smarttab                " <BS> apaga <tab> e espaços equivalentes
set autoindent
" set smartindent           " Obsoleto

" Backspace em mais de uma linha
set backspace=eol,start,indent

set nobackup
set noswapfile

" Histórico da linha de comando
set history=500

set ignorecase smartcase

" Busca incremental
set incsearch

" Interface
set background=dark

" Deixa a rolagem lenta
"set cursorline

" Habilita o suporte a sintaxe
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

" Adiciona _ a iskeyword
set iskeyword+=_

" Área de transferência
if has("unnamedplus")
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Necessário para exibir corretamente todos os caracteres
set encoding=utf8

" }}}


" MAPEAMENTOS {{{

" Inserir linhas e continuar em modo normal
noremap <leader>o o<ESC>:echo<CR>
noremap <leader>O O<ESC>:echo<CR>

" Isto é para a lista de tags
noremap <F4> :Tagbar<CR>

" NERDTree
noremap <F2> :NERDTreeToggle<CR>

" Ctrl+espaço mapeado para omnicompletion
inoremap <C-Space> <C-X><C-O>

noremap <F6> :%s/^\t*\s*$//g<CR>


" Barra de espaço/backspace mapeados para PageDown/PageUp no modo de comandos
noremap <Space> 
noremap <BS> 

" Abas
nnoremap <C-Tab> :tabnext<CR>       " Próxima aba
nnoremap <S-C-Tab> :tabprev<CR>     " Aba anterior
nnoremap <Leader>tc :tabclose<CR>   " Fechar aba

" Janelas
noremap <C-j> <C-w>j               " Janela abaixo
noremap <leader>j <C-w>j               " Janela abaixo
noremap <C-k> <C-w>k               " Janela acima
noremap <C-h> <C-w>h               " Janela à esquerda
noremap <C-l> <C-w>l               " Janela à direita

" Tamanho das janelas (buffers)
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Salva/recarrega sessão
nnoremap <c-q>s :mksession! ~/vim_local/session<cr>
nnoremap <c-q>r :source ~/vim_local/session<cr>

" this makes the mouse paste a block of text without formatting it
" (good for code)
" noremap <MouseMiddle> <esc>"*p

" Insere data e hora atual
nnoremap <c-f5> "=strftime("%d/%m/%y %T")<cr>P

" Abre arquivo de tarefas
"if MySys() == "windows"
"    nnoremap <F4> :tabe ~/útil/tarefas.txt<cr>
"endif

" Remover endentação
inoremap <S-Tab> <C-o><<

" Comandos do SingleCompile
nnoremap <F9> :SCCompile<cr>
nnoremap <F10> :SCCompileRun<cr>

" Abrir links da web/pesquisar palavras
" let g:netrw_nogx = 1 " disable netrw's gx mapping.

" nnoremap gx <Plug>(openbrowser-smart-search)
" vnoremap gx <Plug>(openbrowser-smart-search)
let g:netrw_browsex_viewer='firefox'

" Navegação por linhas visuais

noremap j gj
noremap k gk

" Correção ortográfica
noremap <leader>ss :set spell!<cr>

" sudo
cnoremap w!! %!sudo tee > /dev/null %

" }}}


" ABREVIAÇÕES {{{


" Evitar erros ao salvar/sair
cab W w| cab Q q| cab Wq wq| cab wQ wq| cab WQ wq

iabbrev enquatno enquanto

" }}}


" DIVERSOS/AUTO-COMANDOS {{{

" Perl
" Isto é para o perldoc.vim
" autocmd BufNewFile,BufRead *.p{l,m} setf perl
" if MySys() == "linux"
"     autocmd BufNewFile,BufRead *.p{l,m} map <F1> :Perldoc<cword><CR>
"     autocmd BufNewFile,BufRead *.p{l,m} let g:perldoc_program='/usr/bin/perldoc'
    " autocmd BufNewFile,BufRead *.p{l,m} source ~/vim_local/ftplugin/perl_doc.vim
" endif

" Use o compilador do Perl para todos os arquivos com extensão *.pl e *.pm
autocmd BufNewFile,BufRead *.p{l,m} compiler perl

" Python
" Use o compilador Python para todos os arquivos com extensão *.py
autocmd BufNewFile,BufRead *.py compiler python

" Java
" autocmd BufNewFile,BufRead *.java set omnifunc=javacomplete#Complete

" Ruby
" Compilador
autocmd BufNewFile,BufRead *.rb compiler ruby
" Recuo de texto
autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 shiftwidth=2

" Arquivos tt2: tratar como html
au BufNewFile,BufRead *.tt2 set ft=html

" Arquivos lpr: tratar como pascal
au BufNewFile,BufRead *.lpr set ft=pascal

" Arquivos md: tratar como markdown
au BufNewFile,BufRead *.md set ft=markdown

" Arquivos do ProGuard
" au BufNewFile,BufRead proguard.cfg,*.pro,*.proguard set ft=proguard

" Muda para o diretório do arquivo atual
" autocmd BufEnter * lcd %:p:h
autocmd BufEnter * Rooter

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

"au BufRead,BufNewFile *.txt set spell
"augroup CursorLine
"  autocmd!

" Only highlight cursor line in active buffer window
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter * if &filetype == 'qf' | set nocursorline | else | set cursorline | endif
"augroup END

" }}}


" GUI {{{
"
""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
    set columns=100 lines=40
    set guioptions-=T                  " -toolbar


    " To save, press ctrl-s.
    nmap <c-s> :w<CR>
    imap <c-s> <Esc>:w<CR>a

    if MySys() == "windows"
        set bg=light
        colors rootwater
        set guifont=Dejavu\ Sans\ mono
    elseif MySys() == "linux"
        set bg=dark
        " colors nazca
        colors aldmeris
        " set guifont=Ubuntu\ mono\ 12
        " set guifont=Dejavu\ Sans\ mono
        set guifont=Inconsolata\ for\ Powerline\ 12

        " Mostrar símbolos especiais somente em Linux/Gvim
        let g:airline_powerline_fonts=1
    endif
else
    " colors ron
    colors ir_black
endif

autocmd BufNewFile,BufRead *.tt set ft=html

" }}}


" VARIÁVEIS DE CONFIGURAÇÃO {{{

" TOHTML
" let g:html_use_css=0
let g:html_number_lines=0

" NERDTree
" let g:NERDTreeDirArrows=0          " Não exibir setas

" Syntastic
let g:syntastic_enable_perl_checker=1

" Abrir URL sob o cursor
"let g:netrw_browsex_viewer = 'firefox'

" Vim-airline

if !has('g:airline_section_b')
    let g:airline_section_b = '%<%{getcwd()}'
endif

" let g:airline_mode_map = {
"     \ '__' : '-',
"     \ 'n'  : 'N',
"     \ 'i'  : 'I',
"     \ 'R'  : 'R',
"     \ 'c'  : 'C',
"     \ 'v'  : 'V',
"     \ 'V'  : 'V-L',
"     \ '' : 'V-B',
"     \ 's'  : 'S',
"     \ 'S'  : 'S',
"     \ '' : 'S',
"     \ }
let g:airline#extensions#branch#empty_message = '*'

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_spac = 1

" Supertab
" Remap autocomplete menu control keys (luciano-fiandesio/dotfiles)
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> j pumvisible() ? "\<C-n>" : "j"
inoremap <expr> k pumvisible() ? "\<C-p>" : "k"
inoremap <expr> h pumvisible() ? "\<PageUp>\<C-n>\<C-p>" : "h"
inoremap <expr> l pumvisible() ? "\<PageDown>\<C-n>\<C-p>" : "l"

let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

" vim-rooter
let g:rooter_change_directory_for_non_project_files = 1

" IndentLine
let g:indentLine_char='│'

" xptemplate
" set runtimepath+=~/vim_local/xpt-personal/

" }}}

" vim:fdm=marker
