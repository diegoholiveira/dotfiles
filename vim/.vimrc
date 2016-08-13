" vim:foldmethod=marker:foldlevel=0
" General {{{
" Use vim settings rather than vi settings
set nocompatible

" UTF-8 Everywhere
set encoding=utf-8
" }}}
" Launch Pathogen {{{
" turn filetype detection off and disable loading
" of indent scripts and filetype plugins
filetype off
filetype plugin indent off

" Enable pathogen
execute pathogen#infect()
execute pathogen#helptags()

" Turn on filetype detection, indent scripts
" filetype plugins and syntax highlighting
filetype plugin indent on
" }}}
" Colors {{{
syntax on

" Set 256 colors mode
set t_Co=256

" Set up the background
set background=dark

" Enable solarized color scheme
colorscheme solarized
" }}}
" Editor layout {{{
" Enable the cursor go one char more on end of line
set virtualedit=onemore

" Enable visual autocomplete for command menu
set wildmenu

" Show absolute line numbers
set number

" Enable highlight the matching [{()}]
set showmatch
" }}}
" Status line {{{
" Always display the status line
set laststatus=2

" Display the buffer number with the file name
set statusline=%02n:%<%f\ %y
" Switch to the right side
set statusline+=%=
" line, character
set statusline+=%(%l,%c%)
" }}}
" Editor settings {{{
" Defines default spell language
set spell spelllang=en_us

" Allows vim to use special comments in the
" files to define some configs
set modelines=1

" Show existing tab as 4 spaces
set tabstop=4

" Number of spaces when editing
set softtabstop=4

" On pressing tab, insert 4 spaces
set expandtab

" Make vim handle better with multiple buffers
set hidden
" }}}
" Navigation {{{
" Create splits will be more easily
set splitbelow
set splitright

" Navigate trought windows will be more easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Backup and swap {{{
" Disable auto backup and swap file
set nobackup
set noswapfile
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd vimenter * highlight clear SignColumn
    " Let vim knows that Vagrant files are ruby!
    autocmd bufenter Vagrantfile setlocal filetype=ruby
    " Enable specific settings to bash files
    autocmd filetype sh setlocal tabstop=2 softtabstop=2
    " Enable specific settings to yaml files
    autocmd filetype yaml setlocal tabstop=2 softtabstop=2
    " Enable specific settings to ruby files
    autocmd filetype ruby setlocal tabstop=2 softtabstop=2
    " Enable specific settings to javascript files
    autocmd filetype javascript setlocal tabstop=2 softtabstop=2
    " Use actual tab chars in Makefiles.
    autocmd filetype make setlocal noexpandtab
augroup END
" }}}
" Syntastic {{{
" Keep the errors list updated with the checkers
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=PSR2"
let g:syntastic_error_symbol = "\u274C"
let g:syntastic_warning_symbol = "\u26A0"
let g:syntastic_style_error_symbol = "\u2049"
let g:syntastic_style_warning_symbol = "\uF4A9"
" }}}
" CtrlP {{{
" Make CtrlP order results top to bottom (first at top)
let g:ctrlp_match_window = 'bottom,order:ttb'
" Make CtrlP always open files in new buffers
let g:ctrlp_switch_buffer = 0
" Make CtrlP respect if we changes the working dir during a session
let g:ctrlp_working_path_mode = 0
" Make CtrlP ignore some file and folders
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}
" Leader shortcuts {{{
" Makes space as the mapleader
let mapleader = "\<Space>"

" Executes SyntasticCheck with space + l
nnoremap <Leader>l :SyntasticCheck<CR>

" Opens the Syntastic errors list with space + e
nnoremap <Leader>e :Errors<CR>

" Open CtrlP with space + o
nnoremap <Leader>o :CtrlP<CR>
" }}}
" Other shortcuts {{{
" Checks the spell with F7
nnoremap <F7> z=
" }}}
