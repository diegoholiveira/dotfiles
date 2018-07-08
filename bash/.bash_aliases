# -----------------------------------------------------------------------------
# Collection of useful aliases
# -----------------------------------------------------------------------------
alias cp="cp -iv"
alias grep="grep --line-number --color=auto"
alias ls="gls --color=auto -AlhF"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias rm="rm -iv"
alias tailf="tail -f"
alias pip-upgrade="pip install --upgrade pip setuptools wheel"


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
  local containers
  containers=$(docker ps -a -q)

  if [ "${containers}" != "" ]; then
    docker rm -f $containers
  else
    echo "No containers to be removed"
  fi
}

docker-clean-images() {
  local images
  images=$(docker images -q)

  if [ "${images}" != "" ]; then
    docker rmi -f $images
  else
    echo "No images to be removed"
  fi
}

docker-clean-volumes() {
  local volumes
  volumes=$(docker volume ls -q)

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
  local pattern=$1
  local folder=$2

  if [ "$folder" == "" ]; then
    rg --hidden --ignore-case $pattern
  else
    rg --hidden --ignore-case $pattern $folder
  fi
}
