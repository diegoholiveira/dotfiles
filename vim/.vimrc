" vim:foldmethod=marker:foldlevel=0
" General {{{
" Use vim settings rather than vi settings
set nocompatible

" UTF-8 Everywhere
set encoding=utf-8

" Disable the annoying beep
set visualbell
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
" Enable visual autocomplete for command menu
set wildmenu

" Show absolute line numbers
set number

" Enable highlight the matching [{()}]
set showmatch

" Highlight search results in the editor
set hlsearch
" }}}
" Status line {{{
" Always display the status line
set laststatus=2
" Clear the statusline
set statusline=
" Display the buffer number
set statusline+=%02n
" Display the file name
set statusline+=\ File:
set statusline+=\ %f
" Display the file type
set statusline+=\ [%{strlen(&filetype)?&filetype:'none'}
" Display the file format
set statusline +=\ %{strlen(&fileformat)?&fileformat:''}
" Display the file encoding
set statusline+=\ %{strlen(&fileencoding)?&fileencoding:&encoding}]
" Add syntastic warnings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Switch to the right side
set statusline+=%=
" Display the current line and total lines
set statusline+=%l\ /\ %L\ \|\ %c
" }}}
" Editor settings {{{
" Defines default spell language
set spell spelllang=en_us

" Disable line wrap
set nowrap

" Enable modeline
set modeline

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
    autocmd FileType vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufEnter *.blade.php setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " Use a real tab char in Makefile
    autocmd FileType make setlocal noexpandtab
    " Remove white space before save
    autocmd BufWritePre * call StripTrailingWhitespace()
augroup END
" }}}
" Syntastic {{{
" Keep the errors list updated with the checkers
let g:syntastic_always_populate_loc_list = 1
" Automatic open an window when errors are detected
let g:syntastic_auto_loc_list = 1
" Verify when open a file
let g:syntastic_check_on_open = 0
" Verify before save
let g:syntastic_check_on_wq = 0
" Setup javascript linter
let g:syntastic_javascript_checkers = ['eslint']
" Setup php linter and codesniffer
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=PSR2"
" Replace default symbols
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
let g:ctrlp_custom_ignore = '\vendor/|vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}
" Shortcuts {{{
" Checks the spell with F7
nnoremap <silent> <F7> z=

" Execute Syntastic
nnoremap <silent> <F5> :SyntasticCheck<CR>

" Execute :CtrlPBuffer to quickly switch buffers
nnoremap <silent> <F2> :CtrlPBuffer<CR>

" Disable or enable the search highlighting
noremap <silent> <C-F> :set hlsearch! hlsearch?<CR>
" Manually removes white spaces
noremap <F3> :call StripTrailingWhitespace()<CR>
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
