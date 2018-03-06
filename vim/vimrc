" vim: foldmethod=marker:foldlevel=0
scriptencoding utf-8
" Plug {{{
let g:vimplug_exists=expand('~/.vim/autoload/plug.vim')
if !filereadable(g:vimplug_exists)
    silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'b4b4r07/vim-hcl'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-hclfmt'
Plug 'fatih/vim-nginx'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'ntpeters/vim-better-whitespace'
Plug 'posva/vim-vue'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'w0rp/ale'
call plug#end()
" }}}
" Spell languages files {{{
let g:spell_en_exists=expand('~/.vim/spell/en.utf-8.spl')
let g:spell_pt_exists=expand('~/.vim/spell/pt.utf-8.spl')
if !filereadable(g:spell_en_exists)
    silent !\curl -fLo ~/.vim/spell/en.utf-8.spl --create-dirs http://ftp.vim.org/pub/vim/runtime/spell/en.utf-8.spl
endif
if !filereadable(g:spell_pt_exists)
    silent !\curl -fLo ~/.vim/spell/pt.utf-8.spl --create-dirs http://ftp.vim.org/pub/vim/runtime/spell/pt.utf-8.spl
endif

" remove variables used to verify the installation
unlet g:vimplug_exists
unlet g:spell_en_exists
unlet g:spell_pt_exists
" }}}
" General {{{
" Define that we are using a fast terminal
set ttyfast

" Enable autoread
set autoread

" Turn on filetype detection, indent scripts
" filetype plugins and syntax highlighting
filetype plugin indent on
" }}}
" Colors {{{
syntax enable

" Enable nord-vim color scheme
silent! colorscheme nord
" }}}
" Editor layout {{{
" Enable visual autocomplete for command menu
set wildmenu

" Show absolute line numbers
set number

" Enable highlight the matching [{()}]
set showmatch

" Always display the status line
set laststatus=2
" }}}
" Editor settings {{{
" Show tab as chars
set list
set listchars=tab:>-

" Defines the search as incremental
set incsearch

" Defines the search as case insensitive
set ignorecase

" Defines the time to switch back to normal mode (ms)
set updatetime=10000

" Defines default spell language
set spell spelllang=en_us

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
" }}}
" Backup and swap {{{
" Disable auto backup and swap file
set nobackup
set noswapfile
" }}}
" Autocmds {{{
augroup configgroup
    " Remove previous autocmds from this group (avoid execute it twice)
    autocmd!

    " Let vim knows that Vagrant files are ruby!
    autocmd BufEnter Vagrantfile setlocal filetype=ruby

    " Teach vim that RAML is fancy YAML
    autocmd BufEnter *.raml setlocal filetype=yaml

    " Define blade templates as html files
    autocmd BufEnter *.blade.php setlocal filetype=html

    " Remove white space before save
    autocmd BufEnter * EnableStripWhitespaceOnSave

    " Switch back to normal mode when inactive
    autocmd CursorHoldI * stopinsert
augroup END
" }}}
" Shortcuts {{{
" Checks the spell with F7
nnoremap <silent> <C-E> z=

" Execute :CtrlPBuffer to quickly switch buffers
nnoremap <silent> <C-O> :CtrlPBuffer<CR>
" }}}
" Commands {{{
" Enable Portuguese in the spell checker
command! Pt setlocal spell spelllang=pt_br

" Enable English in the spell checker
command! En setlocal spell spelllang=en_us
" }}}
" Plugin: Ale {{{
" Define better error and warning icons
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

" Configure ale to pass some args to flake8 (python linter)
let g:ale_python_flake8_args = '--ignore=E501,E999'

" Configure pylint to not show missing doctring
let g:ale_python_pylint_options = '--disable=missing-docstring'

" Add the linter name in the error message
let g:ale_echo_msg_format = '[%linter%] %s'
" }}}
" Plugin: CtrlP {{{
" Make CtrlP order results top to bottom (first at top)
let g:ctrlp_match_window = 'bottom,order:ttb'

" Make CtrlP always open files in new buffers
let g:ctrlp_switch_buffer = 0

" Make CtrlP respect if we changes the working dir during a session
let g:ctrlp_working_path_mode = 0

" Disable cache
let g:ctrlp_use_caching = 0

" Allow hidden files be displayed
let g:ctrlp_show_hidden = 1

" Define multiple opens to open hidden buffers
let g:ctrlp_open_multiple_files = 'i'

" Define files and folders that must be ignored by ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn)|vendor|venv|node_modules|dist|plugged|target)$',
    \ 'file': '\v\.(exe|so|dll|pyc|DS_Store)$'
\ }
" }}}
" Plugin: Lightline {{{
" Define solarized as default colorscheme
let g:lightline = { 'colorscheme': 'nord' }
" }}}
