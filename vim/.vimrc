" vim:foldmethod=marker:foldlevel=0
" Plug {{{
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug_exists)
    echo "Installing Vim-Plug..."
    echo ""
    silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elmcast/elm-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fatih/vim-hclfmt'
Plug 'jelera/vim-javascript-syntax'
Plug 'ntpeters/vim-better-whitespace'
Plug 'posva/vim-vue'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}
" Spell languages files {{{
let spell_en_exists=expand('~/.vim/spell/en.utf-8.spl')
let spell_pt_exists=expand('~/.vim/spell/pt.utf-8.spl')
if !filereadable(spell_en_exists)
    echo "Downloading English spell file..."
    echo ""
    silent !\curl -fLo ~/.vim/spell/en.utf-8.spl --create-dirs http://ftp.vim.org/pub/vim/runtime/spell/en.utf-8.spl
endif
if !filereadable(spell_pt_exists)
    echo "Downloading Portuguese spell file..."
    echo ""
    silent !\curl -fLo ~/.vim/spell/pt.utf-8.spl --create-dirs http://ftp.vim.org/pub/vim/runtime/spell/pt.utf-8.spl
endif
" }}}
" General {{{
" Disable the arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" UTF-8 Everywhere
set encoding=utf-8

" Disable the annoying beep
set noerrorbells visualbell t_vb=

" Define that we are using a fast terminal
set ttyfast

" Enable autoread
set autoread

" Turn on filetype detection, indent scripts
" filetype plugins and syntax highlighting
filetype plugin indent on
" }}}
" Colors {{{
syntax on

" Enable solarized color scheme
silent! colorscheme solarized
" }}}
" Editor layout {{{
" Enable visual autocomplete for command menu
set wildmenu

" Highlight the current line
set cursorline

" Show absolute line numbers
set number

" Enable highlight the matching [{()}]
set showmatch

" Highlight search results in the editor
set hlsearch

" Defines the search as case insensitive
set ignorecase
" }}}
" Editor settings {{{
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
" Airline {{{
" Always display the status line
set laststatus=2
" Use solarized theme
let g:airline_theme='solarized'
" Display tabline by default
let g:airline#extensions#tabline#enabled = 1
" Enable powerline fonts
let g:airline_powerline_fonts = 1
" }}}
" CtrlP {{{
" Invoke Ctrl-p with c-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Make CtrlP order results top to bottom (first at top)
let g:ctrlp_match_window = 'bottom,order:ttb'
" Make CtrlP always open files in new buffers
let g:ctrlp_switch_buffer = 0
" Make CtrlP respect if we changes the working dir during a session
let g:ctrlp_working_path_mode = 0
" Disable cache
let g:ctrlp_use_caching = 0
" Disable the default custom ignore
if exists("g:ctrlp_custom_ignore")
  unlet g:ctrlp_custom_ignore
endif
" Disable the custom command
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
" Define files and folders that must be ignored by ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|vendor$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
" }}}
" rust.vim {{{
" Enable auto formatting
let g:rustfmt_autosave = 1
" }}}
" Shortcuts {{{
" Checks the spell with F7
nnoremap <silent> <C-E> z=

" Disable or enable the search highlighting
noremap <silent> <C-F> :set hlsearch! hlsearch?<CR>

" Execute :CtrlPBuffer to quickly switch buffers
nnoremap <silent> <C-O> :CtrlPBuffer<CR>
" }}}
" Commands {{{
" Enable Portuguese in the spell checker
command! Pt setlocal spell spelllang=pt_br
" Enable English in the spell checker
command! En setlocal spell spelllang=en_us
" }}}
