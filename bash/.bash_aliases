# collection of useful aliases
alias tailf="tail -f"
alias grep="grep --color=always -n"
alias ls="ls -AlhF"

search() {
  grep --exclude-dir="vendor" \
    --exclude-dir="node_modules" \
    --exclude-dir=".git" \
    -I -r -e "$1" "${2:-.}"
}

curl-post-json() {
  local URL=$1
  local CONTENT=$2

  curl -H "Content-Type: application/json" -X POST -d "$CONTENT" "$URL"
}

new-sh() {
  local FILENAME=$1

  if [ ! -f "$FILENAME" ]; then
    cat > "$FILENAME" <<"EOF"
#!/usr/bin/env bash
# vim: ft=sh
set -euo pipefail
IFS=$'\n\t'

EOF

    chmod +x "$FILENAME"
    return 0
  else
    echo "File already exists"
    return 1
  fi
}

docker-clean() {
  # Delete all containers
  docker rm -f $(docker ps -a -q)

  # Delete all Docker image
  docker rmi -f $(docker images -q)
}
