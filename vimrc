" Enable pathogen
execute pathogen#infect()

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

" Turn on file type detection
filetype plugin indent on

" Show absolute line numbers
set number

" Turn on spellcheck for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" Turn on spellcheck for gitcommit
autocmd FileType gitcommit setlocal spell

" Disable auto install for go plugin
let g:go_disable_autoinstall = 0

" Remap the leader key
let mapleader = ","

" UTF-8 Everywhere
set encoding=utf-8

