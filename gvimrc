if has("gui_macvim")
    " MacVim options

    " Smooth fonts
    set antialias
    " hide toolbar
    set guioptions-=T
    " hide right scrollbar
    set guioptions-=r
    set guioptions-=R
    " hide left scrollbar
    set guioptions-=l
    set guioptions-=L
    " GUI is running or is about to start.
    " Maximize gvim window (for an alternative on Windows, see simalt below).
    set lines=999 columns=999
endif

