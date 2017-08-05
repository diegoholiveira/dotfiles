# collection of useful aliases
alias tailf="tail -f"
alias grep="grep --color=always -n"
alias php-repl="php -a -d auto_prepend_file=./vendor/autoload.php"
alias ls="exa -la"
alias tree="exa --tree"

search() {
  grep -I -r -e $1 ${2:-.}
}
