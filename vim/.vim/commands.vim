" Easy switch between document languages
command! Pt setlocal spelllang=pt_br
command! En setlocal spelllang=en_us

" Format a JSON document
command! JsonPretty execute "%! jq '.'"
