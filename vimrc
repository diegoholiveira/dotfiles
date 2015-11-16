" Use vim settings rather than vi settings
set nocompatible

" Configure an useful status line
set statusline=%02n:%<%f\ %y 	" Display the buffer number with the file name
set statusline+=%=		" Switch to the right side
set statusline+=%(%l,%c%)	" line, character

" Always display the status line
set laststatus=2

" Disable filetype
filetype off

" Enable pathogen
execute pathogen#infect()

" Turn on file type detection
filetype on
filetype plugin indent on

" Enable smart indent
set smartindent

" Configure the default behavior for
" indent (global setup)
set expandtab
set shiftwidth=4
set softtabstop=4

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

" Enable specific settings to YAML files
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2

" Make crontab work like a charm with Vim
autocmd filetype crontab setlocal nobackup nowritebackup

" UTF-8 Everywhere
set encoding=utf-8

" Disable fold (this is a very annoying thing!)
set nofoldenable

" Recommended settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|venv)$'

