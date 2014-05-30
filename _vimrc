" Vim configuration for Windows

fun! MySys()
    return "windows"
endfun

let g:home_prefix = 'c:/'

exec "set rtp^=" . g:home_prefix . "vim_local"
exec "set rtp+=" . g:home_prefix . "vim_local/bundle/vundle/"

exec "source " . g:home_prefix . "vim_local/vimrc"

