" vim:foldmethod=marker:foldlevel=0
" Fonts {{{
" smooth fonts
set antialias

" Define the editor font based on the gui interface
if has("gui_macvim")
    set guifont=Knack\ Nerd\ Font:h10
else
    set guifont=Knack\ Nerd\ Font\ 10
endif
" }}}
" Interface layout {{{
" Hide toolbar
set guioptions-=T
" Hide right scroll bar
set guioptions-=r
set guioptions-=R
" Hide left scroll bar
set guioptions-=l
set guioptions-=L
" }}}
