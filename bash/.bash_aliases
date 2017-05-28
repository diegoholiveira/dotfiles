# collection of useful aliases
alias tailf="tail -f"
alias grep="grep --color=always -n"
alias php-repl="php -a -d auto_prepend_file=./vendor/autoload.php"
alias ls="ls -AlhF"

search() {
  grep -r -e $1 ${2:-.}
}
