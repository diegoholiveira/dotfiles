" Enable autoread
set autoread

" Turn on filetype detection, indent scripts
" filetype plugins and syntax highlighting
filetype plugin indent on

" Disable swap files
set noswapfile

" Set english as default language
set spell spelllang=en_us

" Enable visual autocomplete for command menu
set wildmenu

" Show absolute line numbers
set number

" Enable highlight the matching [{()}]
set showmatch

" Always display the status line
set laststatus=2

" Show tab as chars
set list
set listchars=tab:>-

" Defines the search as incremental
set incsearch

" Defines the search as case insensitive
set ignorecase

" Disable line wrap
set nowrap

" Show existing tab as 4 spaces
set tabstop=4

" Number of spaces when editing
set softtabstop=4

" Indents will have a width of 4
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Make vim allow me to have more than one unsaved buffers
set hidden

" Configure the behavior of the backspace in insert mode
set backspace=indent,eol,start

" Start scroll when I'm 3 lines from top/bottom
set scrolloff=3

" Configure mapleader to be ,
let mapleader = ','
