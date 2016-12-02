" vim:foldmethod=marker:foldlevel=0
" Fonts {{{
" smooth fonts
set antialias

" Define the editor font based on the gui interface
if has("gui_macvim")
    set guifont=DroidSansMonoforPowerline\ Nerd\ Font:h12
else
    set guifont=DroidSansMonoforPowerline\ Nerd\ Font\ 12
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
