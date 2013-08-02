"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"sets how many lines of history VIM has to rememeber
set history=1000

" Enbale filetype plugins
filetype on
filetype plugin on

" vi compatibility
set nocompatible

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = ","
"let g:mapleader = ","

" Fast saving
"nmap <leader>w :w!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of command bar
set cmdheight=2

"" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Makes search act like search in modern browsers
"set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on
colorscheme Monokai-Refined
"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    " support 256 colors in Lion terminal 
    set t_Co=256
endif

" support 256 colors in terminal 
set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" toggle displaying tabs with ,s
set listchars=tab:.»
nmap <silent> <leader>s :set nolist!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
au BufNewFile,BufRead *.psql set filetype=sql
set directory=~/tmp,/tmp             " keep swap files in one location

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l \ %[%p%%]

" Set status to show all details
set statusline=%F           " Full path to filename
set statusline+=%m          " Modified flag
set statusline+=%h          " Help buffer flag
set statusline+=%w          " Preview window flag
set statusline+=\ %y        " File type
set statusline+=%=          " Switch to right align
set statusline+=[%03.3b     " ASCII value for character under cursor
set statusline+=\ [%v       " Virtual column number
set statusline+=,%l/%L]     " Current line number, total lines
set statusline+=\ [%p%%]    " Percentage through file

"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l 
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l 

set statusline+=%=          " Switch to right align
set statusline+=[Ascii:%03.3b     " ASCII value for character under cursor
set statusline+=\ [Column:%v       " Virtual column number
set statusline+=,Line:%l/%L]     " Current line number, total lines
set statusline+=\ [:%p%%]    " Percentage through file



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"format
"set smartindent
"set textwidth=80
"set title
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"set laststatus=2
"set showtabline=2

" Set status to show all details
"set statusline=%F           " Full path to filename
"set statusline+=%m          " Modified flag
"set statusline+=%h          " Help buffer flag
"set statusline+=%w          " Preview window flag
"set statusline+=\ %y        " File type
"set statusline+=%=          " Switch to right align
"set statusline+=[%03.3b     " ASCII value for character under cursor
"set statusline+=/0x%02.2B]  " Same, but in hex
"set statusline+=\ [%v       " Virtual column number
"set statusline+=,%l/%L]     " Current line number, total lines
"set statusline+=\ [%p%%]    " Percentage through file

" syntax
"syntax on
"syntax enable

"search optoins
"enable search highligting
"set hlsearch

" support 256 colors in Lion terminal 
"set t_Co=256

" Folding
"set foldenable
"set foldmethod=syntax
"set foldlevel=99

" always show file name
"set modeline
"set ls=2

"set nobackup                         " don't make a backup before overwriting a file.
"set nowritebackup                    " ^^^
"set noswapfile                       " don't need no stinky swapfiles
"set directory=~/tmp,/tmp             " keep swap files in one location


"colorscheme
"colorscheme ir_black
"colorscheme Monokai
"colorscheme Monokai-Refined
