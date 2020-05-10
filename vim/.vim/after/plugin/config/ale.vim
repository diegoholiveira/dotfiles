" Configure ale to use only explicit linters
let g:ale_linters_explicit = 1

" Configure Ale to fix code on save
let g:ale_fix_on_save = 1

" Configure <leader>+f to call ALEFix
nnoremap <silent> <leader>f :ALEFix<CR>
