setlocal noexpandtab
setlocal nolist

let b:ale_linters = ['golangci-lint', 'gopls']
let b:ale_fixers = ['goimports']
let b:ale_go_golangci_lint_package = 1
let b:go_gopls_use_global = 1
