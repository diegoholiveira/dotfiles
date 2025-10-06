" eruby is considered a 'derived' filetype of ruby so it needs to be applied
" after the standard `ftplugin/ruby.vim`
let b:ale_linters=['erb']
let b:ale_fixers=['erb-formatter']
