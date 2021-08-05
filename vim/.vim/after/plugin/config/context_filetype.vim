if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
endif

let g:context_filetype#filetypes.svelte =
    \ [
    \    {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
    \    {'filetype' : 'css', 'start' : '<style>', 'end' : '</style>'},
    \ ]
