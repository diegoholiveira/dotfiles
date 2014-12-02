" Use vim settings rather than vi settings
set nocompatible

" Make vim handle better with multiple buffers
set hidden

" Turn on syntax highlighying
syntax enable

" Turn on file type detection
filetype plugin indent on

" Show absolute line numbers
set number

" Turn on spellcheck for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" Turn on spellcheck for gitcommit
autocmd FileType gitcommit setlocal spell

