set history=1000
"filetype indent plugin on
au BufNewFile,BufRead *.psql set filetype=sql

"vi compatibility
set nocompatible

"format
"set smartindent
set showmatch
"set textwidth=80
set title
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set laststatus=2
"set showtabline=2

" Set status to show all details
set statusline=%F           " Full path to filename
set statusline+=%m          " Modified flag
set statusline+=%h          " Help buffer flag
set statusline+=%w          " Preview window flag
set statusline+=\ %y        " File type
set statusline+=%=          " Switch to right align
set statusline+=[%03.3b     " ASCII value for character under cursor
set statusline+=/0x%02.2B]  " Same, but in hex
set statusline+=\ [%v       " Virtual column number
set statusline+=,%l/%L]     " Current line number, total lines
set statusline+=\ [%p%%]    " Percentage through file

" syntax
syntax on
syntax enable

"search optoins
"enable search highligting
set hlsearch

" support 256 colors in Lion terminal 
set t_Co=256

" files 
filetype on
"filetype indent on
filetype plugin on

" Folding
set foldenable
set foldmethod=syntax
set foldlevel=99

" always show file name
set modeline
set ls=2

"colorscheme
"colorscheme ir_black
"colorscheme Monokai
colorscheme Monokai-Refined
