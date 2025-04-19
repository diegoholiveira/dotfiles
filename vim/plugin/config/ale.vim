let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
nnoremap <silent> <leader>f :ALEFix<CR>
nnoremap <silent> <leader>r :ALERename<CR>
nnoremap <silent> <leader>c :ALECodeAction<CR>
nnoremap <silent> <leader>d :ALEGoToDefinition<CR>
