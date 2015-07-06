" Maintainer: Darlan P. de Campos <darlanpedro (a) gmail com>
" License: Public Domain

" INÍCIO {{{

" Pasta do Vim
let s:vim_folder = g:home_prefix . "vim_local/"

exec "set rtp=" . s:vim_folder . ",$VIMRUNTIME"
exec "set rtp+=" . s:vim_folder . "bundle/vundle/"

runtime plugin/functions.vim

let g:mysys = MySys()

" }}}


" VUNDLE {{{

set nocompatible

filetype off

" set the runtime path to include Vundle and initialize

call vundle#rc(s:vim_folder . "bundle/")

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
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
" Plugin 'bling/vim-airline'
Plugin 'itchyny/lightline.vim'
Plugin 'mileszs/ack.vim'

" Requisito: Python
if g:mysys == "linux"
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
endif

" Plugin 'drmingdrmer/xptemplate'
" Plugin 'ludovicchabant/vim-lawrencium'

" http://www.lucianofiandesio.com/vim-configuration-for-happy-java-coding
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-rooter'

"Plugin 'Valloric/YouCompleteMe'

" Plugin 'Marslo/EnhCommentify.vim'
Plugin 'tomtom/tcomment_vim'

"Plugin 'sentientmachine/erics_vim_syntax_and_color_highlighting'
"Plugin 'tpope/vim-rails.git'

" Plugin 'flazz/vim-colorschemes'

" Tipos de arquivos
Plugin 'groenewege/vim-less'

" Repositórios pessoais/forks
Plugin 'dcampos/vim-aldmeris'
Plugin 'dcampos/proguard.vim'
Plugin 'vim-scripts/javacomplete'

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


" VARIÁVEIS DE CONFIGURAÇÃO {{{

" Mapleader: configura a tecla <leader>.
let mapleader = ","
let g:mapleader = ","

" TOHTML
" let g:html_use_css=0
let g:html_number_lines = 0

" NERDTree
" let g:NERDTreeDirArrows=0          " Não exibir setas

" Syntastic
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_enable_balloons = 1
let g:syntastic_java_javac_custom_classpath_command =
    \ 'echo -n "src/:lib/*";' .
    \ '[ -e classpath.txt ] && echo -n ":$( cat classpath.txt )"'
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
let g:loaded_syntastic_cpp_gcc_check_header = 1

" Vim-airline

if !has('g:airline_section_b')
    " let g:airline_section_b = '%<%{getcwd()}'
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

" lightline.vim
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive'
      \ },
  \ }

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '' . _ : ''
  endif
  return ''
endfunction

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

" YCM
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" CtrlP
" if mysys ==? 'linux'
    " let g:ctrlp_user_command = 'find %s -type f'
    " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" elseif mysys ==? 'linux'
    " let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
" endif

" IndentLine - ver acima: GUI
" let g:indentLine_char='│'

" xptemplate
" set runtimepath+=~/vim_local/xpt-personal/

" }}}


" DEFINIÇÕES {{{

" nnoremap ,, ,
" vnoremap ,, ,

" Nenhum aviso visual
set visualbell

set noerrorbells

" Números de linhas
set number
set linebreak

" TESTE
set lazyredraw

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

" Deixa a rolagem lenta?
set cursorline

" Reduz lentidão em linhas longas
set synmaxcol=128

" Habilita o suporte a sintaxe
syntax on

filetype plugin on

runtime macros/matchit.vim

" Linha de status
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%1*%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=\ %{getcwd()}                " current directory
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Menu para completar comandos
set wildmenu

set wildignorecase

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

" Leader {{{
" Inserir linhas e continuar em modo normal
nnoremap <Leader>o o<ESC>:echo<CR>
nnoremap <Leader>O O<ESC>:echo<CR>

" Salvar arquivo
nnoremap <Leader>w :w<CR>

" Source File
nnoremap <Leader>sf :source %<CR>

" vim-fugitive
nnoremap <Leader>gc :Gcommit -a<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gu :Git pull -u<CR>
nnoremap <Leader>gl :Glog<CR>

" Espaços em branco
nnoremap <Leader>tw :ToggleWhitespace<CR>
nnoremap <Leader>rw :RemoveWhitespace<CR>
vnoremap <Leader>rw :RemoveWhitespace<CR>

" Renomear arquivo
nnoremap <Leader>mv :RenameFile<CR>

nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bl :ls<CR>

" }}}

" Alternar lista de tags
noremap <F4> :Tagbar<CR>

" Alternar NERDTree
noremap <F2> :NERDTreeToggle<CR>

" Ctrl+espaço mapeado para omnicompletion
" inoremap <C-Space> <C-X><C-O>

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
noremap <Leader>j <C-w>j               " Janela abaixo
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
let g:netrw_nogx = 1 " disable netrw's gx mapping.

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" let g:netrw_browsex_viewer='firefox'

" Navegação por linhas visuais

noremap j gj
noremap k gk

" Correção ortográfica
noremap <Leader>ss :set spell!<cr>

" sudo
cnoremap w!! %!sudo tee > /dev/null %

" }}}


" ABREVIAÇÕES {{{


" Evitar erros ao salvar/sair
cab W w | cab Q q | cab Wq wq | cab wQ wq | cab WQ wq

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
augroup ft_perl
    auto!
    autocmd BufNewFile,BufRead *.p{l,m} compiler perl
augroup end

" Python
" Use o compilador Python para todos os arquivos com extensão *.py
augroup ft_python
    auto!
    autocmd BufNewFile,BufRead *.py compiler python
augroup end

" Java
augroup ft_java
    auto!
    autocmd BufNewFile,BufRead *.java set omnifunc=javacomplete#Complete
augroup end

" Ruby
augroup ft_ruby
    autocmd!
    " Compilador
    autocmd BufNewFile,BufRead *.rb compiler ruby
    " Recuo de texto
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 shiftwidth=2
augroup end

" Outros tipos
augroup ft_misc
    autocmd!

    " Arquivos tt, tt2: tratar como html
    autocmd BufNewFile,BufRead *.tt set ft=html
    autocmd BufNewFile,BufRead *.tt2 set ft=html


    " Arquivos lpr: tratar como pascal
    autocmd BufNewFile,BufRead *.lpr set ft=pascal

    " Arquivos md: tratar como markdown
    autocmd BufNewFile,BufRead *.md set ft=markdown

    autocmd BufWrite topicos.md silent! !gimli % &

    " Arquivos do ProGuard
    " autocmd BufNewFile,BufRead proguard.cfg,*.pro,*.proguard set ft=proguard
augroup end

" Inserir modelo quando iniciar novo arquivo
augroup templates
    autocmd!
    " read in template files
    autocmd BufNewFile *.* silent! execute '0r ' . s:vim_folder . 'templates/template.'.expand("<afile>:e")

    " parse special text in the templates after the read
    autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup end

"autocmd BufRead,BufNewFile *.txt set spell
augroup cursor_line
    autocmd!

    " Only highlight cursor line in active buffer window
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * if &filetype == 'qf' | set nocursorline | else | set cursorline | endif
augroup END

augroup etc_group
    autocmd!

    " Cada arquivo em uma nova aba - causa alguns erros
    "autocmd BufAdd,BufNewFile * nested tab sball

    " Omnicomplete
    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
                    \   if &omnifunc == "" |
                    \       setlocal omnifunc=syntaxcomplete#Complete |
                    \   endif
    endif

    " Muda para o diretório do arquivo atual
    " autocmd BufEnter * lcd %:p:h
    autocmd BufEnter * Rooter


    " Destacar espaços em branco
    autocmd BufRead,InsertLeave,InsertEnter * silent! :EnableWhitespace
    autocmd InsertEnter * silent! :DisableWhitespace
augroup end

" }}}

" GUI {{{

if has("gui_running")
    set columns=100 lines=40
    set guioptions-=T                  " -toolbar


    " To save, press ctrl-s.
    nmap <c-s> :w<CR>
    imap <c-s> <Esc>:w<CR>a

    if g:mysys == "win"
        set bg=light
        colors rootwater
        set guifont=Dejavu\ Sans\ mono
    elseif g:mysys == "linux"
        set bg=dark
        colors aldmeris
        " set guifont=Fantasque\ sans\ mono\ 12

        " Mostrar símbolos especiais somente em Linux/Gvim
        let g:airline_powerline_fonts=1
    endif

    let g:indentLine_char='▸'

else
    " colors ron
    colors ir_black
    let g:indentLine_char='»'
endif

" }}}


" vim:fdm=marker
