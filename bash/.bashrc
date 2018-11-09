#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Colors
# ------------------------------------------------------------------------------
if [ -f ~/.dir_colors ] ; then
  eval "$(gdircolors -b ~/.dir_colors)"
fi
COLOR_BLUE="\\[$(tput setaf 4)\\]"
COLOR_GREEN="\\[$(tput setaf 2)\\]"
COLOR_OFF="\\[$(tput sgr0)\\]"
COLOR_RED="\\[$(tput setaf 1)\\]"


# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------
__pyenv() {
  if [ x"$PYENV_VERSION" != x ]; then
    PS1="${PS1} working on ${COLOR_RED}\${PYENV_VERSION}${COLOR_OFF}"
  fi
}

__last_status() {
  if [ "${LAST_STATUS}" == "0" ]; then
    PS1="${PS1}\\n${COLOR_GREEN}\$${COLOR_OFF} "
  else
    PS1="${PS1}\\n${COLOR_RED}\$${COLOR_OFF} "
  fi
}

set_prompt_vars() {
  LAST_STATUS="$?"
  # print the current dir
  PS1="${COLOR_BLUE}\\w${COLOR_OFF}"
  # print the current python environment
  __pyenv
  # print the current git status
  PS1="${PS1} \$(__git_ps1 '(%s)')"
  # print the prompt indicator
  __last_status
}


# ------------------------------------------------------------------------------
# Setup script variables
# ------------------------------------------------------------------------------
if [ -f /usr/libexec/java_home ]; then
  JAVA_HOME=$(/usr/libexec/java_home)
fi
PATH="/usr/local/opt/python/libexec/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH=~/.npm-packages/bin:$PATH


# ------------------------------------------------------------------------------
# Export configuration variables
# ------------------------------------------------------------------------------
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
export PROMPT_COMMAND=set_prompt_vars
export PYENV_VIRTUALENV_DISABLE_PROMPT=true
export VAGRANT_DEFAULT_PROVIDER=virtualbox


# ------------------------------------------------------------------------------
# External scripts
# ------------------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_private ]; then
  . ~/.bash_private
fi

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

if [ -f /usr/local/Homebrew/completions/bash/brew ]; then
  . /usr/local/Homebrew/completions/bash/brew
fi

eval "$(pyenv init -)"

if [ -f ~/.fzf.bash ]; then
  . ~/.fzf.bash
fi
