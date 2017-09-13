# collection of useful aliases
alias tailf="tail -f"
alias grep="grep --color=always -n"
alias ls="ls -AlhF"

search() {
  grep -I -r -e $1 ${2:-.}
}

curl-post-json() {
  local URL=$1
  local CONTENT=$2

  curl -H "Content-Type: application/json" -X POST -d $CONTENT $URL
}
