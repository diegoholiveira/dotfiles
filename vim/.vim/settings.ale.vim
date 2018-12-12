" Configure Ale to fix code on save
let g:ale_fix_on_save = 1

" Define better error and warning icons
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

" Configure pylint to not show missing doctring
let g:ale_python_pylint_options = '--disable=missing-docstring'

" Configure python isort
let g:ale_fixers = {
\   'python': ['autopep8', 'isort'],
\   'json': 'jq',
\}

" Add the linter name in the error message
let g:ale_echo_msg_format = '[%linter%] %s'
