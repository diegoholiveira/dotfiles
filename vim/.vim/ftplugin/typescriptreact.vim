let b:ale_linters = ['eslint', 'tsserver']
let b:ale_fixers = ['prettier', 'eslint']

" forces vim to rescan the entire buffer when highlighting
setlocal syntax sync fromstart
