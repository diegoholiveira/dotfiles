" go must use hard tabs
setlocal noexpandtab

" Disable char list
setlocal nolist

" Check source code
let b:ale_linters = ['golangci-lint']

" Format files
let b:ale_fixers = ['goimports']
