" Maintainer: Darlan P. de Campos <darlanpedro (a) gmail com>
" License: Public Domain

" INÍCIO {{{

" Pasta do Vim
let s:vim_folder = g:home_prefix . "vim_local/"

exec "set rtp=" . s:vim_folder . ",$VIMRUNTIME"

runtime plugin/functions.vim

let g:mysys = MySys()

set nocompatible

" }}}


" VIM-PLUG {{{

" set the runtime path to include Vundle and initialize

call plug#begin(s:vim_folder . "plugged/")

" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
" Plugin 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do':
    \ 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'c9s/perlomni.vim', { 'for': 'perl' }
Plug 'hotchpotch/perldoc-vim', { 'for': 'perl' }
Plug 'Yggdroot/indentLine'
Plug 'kien/ctrlp.vim'
Plug 'tyru/open-browser.vim'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'

" Requisito: Python
if g:mysys == "linux"
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'Valloric/YouCompleteMe',
                \ { 'do': './install.sh --clang-completer --system-libclang'}
endif

" Plugin 'drmingdrmer/xptemplate'
" Plugin 'ludovicchabant/vim-lawrencium'

Plug 'pgilad/vim-skeletons'

" http://www.lucianofiandesio.com/vim-configuration-for-happy-java-coding
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-rooter'

" Plugin 'Marslo/EnhCommentify.vim'
Plug 'tomtom/tcomment_vim'

" Plugin 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'gosukiwi/vim-atom-dark'
Plug 'dcampos/vim-aldmeris'

" Tipos de arquivos
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'dcampos/proguard.vim', { 'for': 'proguard' }

" Completação
" Plug 'vim-scripts/javacomplete', { 'for': 'java' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': ['java', 'jsp'] }

" Sessão
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'

Plug 'MarcWeber/vim-addon-local-vimrc'

call plug#end()

" END VIM-PLUG }}}


" VARIÁVEIS DE CONFIGURAÇÃO {{{

" Mapleader: configura a tecla <leader>.
let mapleader = ","
let g:mapleader = ","

" TOHTML
" let g:html_use_css=0
let g:html_number_lines = 0

let g:ws_enabled = 1

" Syntastic
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_enable_balloons = 1
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_java_javac_config_file = '.syntastic'
" let g:syntastic_java_javac_custom_classpath_command =
"     \ 'echo -n "src/:lib/*";' .
"     \ '[ -e classpath.txt ] && echo -n ":$( cat classpath.txt )"'
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
let g:loaded_syntastic_cpp_gcc_check_header = 1

" lightline.vim
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'curdir', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'curdir': 'CurDir',
      \ },
  \ }

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '' . _ : ''
  endif
  return ''
endfunction

function! CurDir()
    let _path = getcwd()
    let _spath = split(_path, "/")
    if len(_path) < 15
        return join(_spath, " > ")
    else
        return _spath[0] . ' … ' . _spath[-1]
    endif
endfunction

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_spac = 1

" Supertab
" Remap autocomplete menu control keys (luciano-fiandesio/dotfiles)
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> j pumvisible() ? "\<C-n>" : "j"
" inoremap <expr> k pumvisible() ? "\<C-p>" : "k"
" inoremap <expr> h pumvisible() ? "\<PageUp>\<C-n>\<C-p>" : "h"
" inoremap <expr> l pumvisible() ? "\<PageDown>\<C-n>\<C-p>" : "l"

let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

" vim-rooter
let g:rooter_change_directory_for_non_project_files = 1
let g:rooter_silent_chdir = 1
let g:rooter_manual_only = 1

" YCM
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>' , '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>' , '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 1
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~/Dev/*','!~/*']
let g:ycm_global_ycm_extra_conf = s:vim_folder . '.ycm_extra_conf.py'


" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" CtrlP
" if mysys ==? 'linux'
    " let g:ctrlp_user_command = 'find %s -type f'
    " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" elseif mysys ==? 'linux'
    " let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
" endif

let skeletons#skeletonsDir = s:vim_folder . '/skeletons'

" vim-session

let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_persist_colors = 0

" perldoc-vim
" let g:perldoc_no_default_key_mappings = 1

" vim-addon-local-vimrc
let g:local_vimrc = { 'names': ['.lvimrc'], 'hash_fun': 'LVRHashOfFile' }

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
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev wQ wq
cabbrev WQ wq

iabbrev enquatno enquanto

cabbrev ss SaveSession
cabbrev os OpenSession

" }}}


" DIVERSOS/AUTO-COMANDOS {{{

" Perl
" Use o compilador do Perl para todos os arquivos com extensão *.pl e *.pm
augroup ft_perl
    auto!
    autocmd FileType perl map <F1> :Perldoc<CR>
    autocmd FileType perl compiler perl
augroup end

" Python
" Use o compilador Python para todos os arquivos com extensão *.py
augroup ft_python
    auto!
    autocmd FileType python compiler python
augroup end

" Java
augroup ft_java
    auto!
    autocmd FileType java,jsp set omnifunc=javacomplete#Complete
    autocmd FileType java nnoremap <F5> :call javacomplete#AddImport()<cr>
    autocmd FileType java,jsp LoadClasspath |
                \ let g:syntastic_java_javac_classpath = g:my_java_classpath |
                \ let g:JavaComplete_LibsPath = g:my_java_classpath
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
    autocmd BufNewFile * %substitute#<+VIM+>\(.\{-\}\)<+END_VIM+>#\=eval(submatch(1))#ge
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
    autocmd BufEnter * RooterEnter
    autocmd BufLeave * RooterLeave


    " Destacar espaços em branco
    autocmd VimEnter,BufNewFile,BufRead * silent! :SetupWhitespace
    autocmd BufRead,InsertLeave * silent! :ShowWhitespace
    autocmd InsertEnter * silent! :HideWhitespace
augroup end

" }}}


" GUI {{{

if has("gui_running")
    set columns=100 lines=40
    set guioptions-=T                  " -toolbar
    set guioptions+=c


    " To save, press ctrl-s.
    nmap <c-s> :w<CR>
    imap <c-s> <Esc>:w<CR>a

    if g:mysys == "win"
        set bg=light
        colors rootwater
        set guifont=Dejavu\ Sans\ mono
    elseif g:mysys == "linux"
        set bg=dark
        colors base16-default

        " Mostrar símbolos especiais somente em Linux/Gvim
        let g:airline_powerline_fonts=1
    endif

    let g:indentLine_char='▸'

else
    " colors ron
    colors ir_black
    let g:indentLine_char='»'

    " Resolver problema com <s-tab> no terminal
    imap <ESc>[Z <s-tab>
    "ounmap <Esc>[Z
endif

" }}}


" vim:fdm=marker
