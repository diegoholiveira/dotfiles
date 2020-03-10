" go must use hard tabs
setlocal noexpandtab

" Disable char list
setlocal nolist

" Check source code with go vet
let b:ale_linters = ['golangci-lint']

" Fix files with gofmt
let b:ale_fixers = ['goimports']
