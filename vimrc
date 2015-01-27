" Disable filetype
filetype off

" Enable pathogen
execute pathogen#infect()

" Turn on file type detection
filetype on
filetype plugin indent on

" Enable smart indent
set smartindent

" Tab as spaces
set expandtab

" Use vim settings rather than vi settings
set nocompatible

" Set 256 colors mode
set t_Co=256

" Make vim handle better with multiple buffers
set hidden

" Turn on syntax highlighying
syntax enable

" Enable solarized color scheme
set background=light
colorscheme solarized

" Show absolute line numbers
set number

" Turn on spellcheck for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" Turn on spellcheck for gitcommit
autocmd FileType gitcommit setlocal spell

" Enable specific settings to Python files
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" Disable auto install for go plugin
let g:go_disable_autoinstall = 0

" Remap the leader key
let mapleader = ","

" UTF-8 Everywhere
set encoding=utf-8

