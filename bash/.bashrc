#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------
function __prompt_command() {
  # ANSI color code
  local COLOR_OFF="\\[\\e[m\\]"

  # regular colors
  local COLOR_RED="\\[\\e[33m\\]"
  local COLOR_GREEN="\\[\\e[32m\\]"
  local COLOR_BLUE="\\[\\e[34m\\]"

  # Dynamic info
  local LAST_STATUS="$?"
  local PYENV_VIRTUALENV

  PYENV_VIRTUALENV=$(pyenv_virtualenv)

  PS1="${COLOR_BLUE}\\w${COLOR_OFF}"

  if [ "${PYENV_VIRTUALENV}" != "" ]; then
    PS1="${PS1} working on ${COLOR_RED}${PYENV_VIRTUALENV}${COLOR_OFF}"
  fi

  PS1="${PS1} $(__git_ps1 '(%s)')"

  if [ "${LAST_STATUS}" == "0" ]; then
    local COLOR_ON="${COLOR_GREEN}";
  else
    local COLOR_ON="${COLOR_RED}";
  fi

  PS1="${PS1}\\n${COLOR_ON}\$${COLOR_OFF} "
}

function pyenv_virtualenv() {
  if [ x"$PYENV_VERSION" != x ]; then
    echo -n "$PYENV_VERSION"
  fi
}


# ------------------------------------------------------------------------------
# Setup local variables
# ------------------------------------------------------------------------------
BASH_COMPLETION_FILE="/usr/local/share/bash-completion/bash_completion"
BREW_COMPLETION_FILE="/usr/local/Homebrew/completions/bash/brew"


# ------------------------------------------------------------------------------
# Setup environment variables
# ------------------------------------------------------------------------------
if [ -f /usr/libexec/java_home ]; then
  JAVA_HOME=$(/usr/libexec/java_home)
fi
PATH="$GOPATH/bin:$PATH"
PATH=~/.npm-packages/bin:$PATH

export BLOCKSIZE=1k
export CLICOLOR=true
export EDITOR=vim
export GIT_EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=false
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto verbose name"
export GOPATH=~/.go
export JAVA_HOME
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH
export PROMPT_COMMAND=__prompt_command
export PYENV_VIRTUALENV_DISABLE_PROMPT=true
export PASSWORD_STORE_DIR=~/dotfiles/pass
export VAGRANT_DEFAULT_PROVIDER=virtualbox


# ------------------------------------------------------------------------------
# External scripts
# ------------------------------------------------------------------------------
. ~/.bash_aliases

if [ -f ~/.bash_private ]; then
  . ~/.bash_private
fi

if [ -f "$HOME/.dir_colors" ] ; then
  eval "$(gdircolors -b "$HOME/.dir_colors")"
fi

. $BASH_COMPLETION_FILE

if [ -f $BREW_COMPLETION_FILE ]; then
  . $BREW_COMPLETION_FILE
fi

eval "$(pyenv init -)"

[ -f ~/.fzf.bash ] && . ~/.fzf.bash
