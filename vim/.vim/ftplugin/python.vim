" Check Python files with pylint
let b:ale_linters = ['pylint']

" " Fix Python files with black
let b:ale_fixers = ['black']

" Configure pylint to not show missing doctring
let b:ale_python_pylint_options = '--disable=missing-docstring'
