# collection of useful aliases
alias tailf="tail -f"
alias grep="grep --color=always -n"
alias ls="ls -AlhF"

search() {
  grep -I -r -e $1 ${2:-.}
}
