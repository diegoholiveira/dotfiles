" Configure Ale to fix code on save
let g:ale_fix_on_save = 1

" Define better error and warning icons
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

" Configure pylint to not show missing doctring
let g:ale_python_pylint_options = '--disable=missing-docstring'

" Configure ale linters
let g:ale_fixers = {
\   'css': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['jq'],
\   'python': ['autopep8', 'isort'],
\}

" Add the linter name in the error message
let g:ale_echo_msg_format = '[%linter%] %s'

" Configure <leader>+f to call ALEFix
nnoremap <silent> <leader>f :ALEFix<CR>
