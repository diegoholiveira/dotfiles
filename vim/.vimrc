" vim:foldmethod=marker:foldlevel=0
" vim-plug {{{
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fatih/vim-hclfmt'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}
" General {{{
" Use vim settings rather than vi settings
set nocompatible

" UTF-8 Everywhere
set encoding=utf-8

" Disable the annoying beep
set visualbell

" Enable autoread
set autoread
" Turn on filetype detection, indent scripts
" filetype plugins and syntax highlighting
filetype plugin indent on
" }}}
" Colors {{{
syntax on

" Set up the background
set background=dark

" Enable solarized color scheme
silent! colorscheme solarized
" }}}
" Editor layout {{{
" Enable visual autocomplete for command menu
set wildmenu

" Show absolute line numbers
set number

" Enable highlight the matching [{()}]
set showmatch

" Highlight search results in the editor
set hlsearch
" }}}
" Editor settings {{{
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

" Make vim handle better with multiple buffers
set hidden

" Configure the behavior of the backspace in insert mode
set backspace=indent,eol,start
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
    " Use indent with size 2 for some files
    autocmd FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufEnter *.blade.php setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " Use a real tab char in Makefile
    autocmd FileType make setlocal noexpandtab
    " Remove white space before save
    autocmd BufWritePre * call StripTrailingWhitespace()
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
" Shortcuts {{{
" Checks the spell with F7
nnoremap <silent> <C-E> z=

" Disable or enable the search highlighting
noremap <silent> <C-F> :set hlsearch! hlsearch?<CR>

" Execute :CtrlPBuffer to quickly switch buffers
nnoremap <silent> <C-O> :CtrlPBuffer<CR>
" }}}
" Functions {{{
" Strips whitespaces
function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
" }}}
