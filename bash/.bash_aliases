# -----------------------------------------------------------------------------
# Collection of useful aliases
# -----------------------------------------------------------------------------
alias cp="cp -iv"
alias grep="grep --color=always -n"
alias ls="ls -AlhF"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias tailf="tail -f"
alias save-terminal-preferences="cp /Users/${USER}/Library/Preferences/com.apple.Terminal.plist ~/dotfiles/com.apple.Terminal.plist"


# -----------------------------------------------------------------------------
# Collection of useful helpers
# -----------------------------------------------------------------------------
create-script() {
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

docker-clean-all() {
  docker-clean-volumes
  docker-clean-containers
  docker-clean-images
}

docker-clean-containers() {
  local containers=$(docker ps -a -q)

  if [ "${containers}" != "" ]; then
    docker rm -f $containers
  else
    echo "No containers to be removed"
  fi
}

docker-clean-images() {
  local images=$(docker images -q)

  if [ "${images}" != "" ]; then
    docker rmi -f $images
  else
    echo "No images to be removed"
  fi
}

docker-clean-volumes() {
  local volumes=$(docker volume ls -q)

  if [ "${volumes}" != "" ]; then
    docker volume rm $volumes
  else
    echo "No volumes to be removed"
  fi
}

finder() {
  open -a Finder $PWD
}

paths() {
  echo -e ${PATH//:/\\n}
}

search() {
  grep --exclude-dir="vendor" \
    --exclude-dir="node_modules" \
    --exclude-dir=".git" \
    -I -r -e "$1" "${2:-.}"
}
