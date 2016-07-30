# -*- mode: sh -*-
# vi: set ft=sh :
# ----------------------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------------------
# Source: http://stackoverflow.com/questions/16715103/bash-prompt-with-last-exit-code
function __prompt_command() {
  # last status code
  local EXIT="$?"

  # ANSI color code
  local Color_Off="\[\033[0m\]"

  # regular colors
  local Red="\[\033[0;31m\]"
  local Green="\[\033[0;32m\]"
  local Blue="\[\033[0;34m\]";
  local Purple="\[\033[0;35m\]"

  VC_INFO=`vcprompt -f "[%n:%b]"`
  VIRTUALENV=`mitsuhikos_virtualenv`

  PS1="$Green\u$Color_Off at $Purple\h$Color_Off in $Blue\w$Color_Off"

  if [ "$VIRTUALENV" != "" ]; then
    PS1+=" working on $Red$VIRTUALENV$Color_Off"
  fi

  if [ "$VC_INFO" != "" ]; then
    PS1+=" $VC_INFO"
  fi

  PS1+="\n$Blue\t$Color_Off"

  if [ $EXIT -eq 0 ]; then
    PS1+=" $Green[✔]$Color_Off";
  else
    PS1+=" $Red[✘]$Color_Off";
  fi

  PS1+=" \$: "
}

# source: https://github.com/mitsuhiko/dotfiles/blob/master/bash/bashrc#L54
function mitsuhikos_virtualenv() {
  if [ x$VIRTUAL_ENV != x ]; then
    if [[ $VIRTUAL_ENV == *.virtualenvs/* ]]; then
      ENV_NAME=`basename "${VIRTUAL_ENV}"`
    else
      folder=`dirname "${VIRTUAL_ENV}"`
      ENV_NAME=`basename "$folder"`
    fi
    echo -n $ENV_NAME
  fi
}


# ----------------------------------------------------------------------------------------
# Setup environment varibles
# ----------------------------------------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export GIT_EDITOR=vim
export PROMPT_COMMAND=__prompt_command
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
export GO15VENDOREXPERIMENT=1
if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
export PYENV_ROOT=/usr/local/var/pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


# ----------------------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------------------
alias git-branch-cleanup="git branch | grep -v \"master\" | xargs git branch -D"


# ----------------------------------------------------------------------------------------
# External scripts
# ----------------------------------------------------------------------------------------
if which pyenv > /dev/null; then
  eval "$(pyenv init -)";
fi

if which pyenv-virtualenv > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

BREW_PREFIX=$(brew --prefix)
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
  . $BREW_PREFIX/etc/bash_completion
  . $BREW_PREFIX/etc/bash_completion.d/git-completion.bash
  . $BREW_PREFIX/etc/bash_completion.d/tmux
fi

if [ -f ~/.local_profile ]; then
  . ~/.local_profile
fi
