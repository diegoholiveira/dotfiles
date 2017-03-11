# collection of useful aliases
alias tailf="tail -f"
alias grep="grep --color=always"
alias php-repl="php -a -d auto_prepend_file=./vendor/autoload.php"

pyenv-init() {
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}
