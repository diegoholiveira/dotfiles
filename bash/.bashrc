# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------
function __prompt_command() {
  # Dynamic info
  local LAST_STATUS="$?"
  local GIT_INFO=$(__git_ps1 "(%s)")
  local PYENV_VIRTUALENV=$(pyenv_virtualenv)

  # ANSI color code
  local COLOR_OFF="\[\033[0m\]"

  # regular colors
  local COLOR_RED="\[\033[0;31m\]"
  local COLOR_GREEN="\[\033[0;32m\]"
  local COLOR_BLUE="\[\033[0;34m\]";
  local COLOR_PURPLE="\[\033[0;35m\]"

  PS1="${COLOR_BLUE}\w${COLOR_OFF}"

  if [ "${PYENV_VIRTUALENV}" != "" ]; then
    PS1="${PS1} working on ${COLOR_RED}${PYENV_VIRTUALENV}${COLOR_OFF}"
  fi

  if [ "${GIT_INFO}" != "" ]; then
    PS1="${PS1} ${GIT_INFO}"
  fi

  if [ "${LAST_STATUS}" == "0" ]; then
    local COLOR_ON="${COLOR_GREEN}";
  else
    local COLOR_ON="${COLOR_RED}";
  fi

  PS1="${PS1}\n${COLOR_ON}\$${COLOR_OFF} "
}

function pyenv_virtualenv() {
  if [ x$PYENV_VERSION != x ]; then
    echo -n $PYENV_VERSION
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
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
export CLICOLOR=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export GIT_EDITOR=vim
export PROMPT_COMMAND=__prompt_command
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export GIT_PS1_SHOWDIRTYSTATE=1
export VAGRANT_DEFAULT_PROVIDER=virtualbox
export GOPATH=~/.go
export PATH=/usr/local/bin:~/.npm-packages/bin:$(go env GOPATH)/bin:$PATH
export PASSWORD_STORE_DIR=~/dotfiles/pass

# ------------------------------------------------------------------------------
# External scripts
# ------------------------------------------------------------------------------
. ~/.bash_aliases

if [ -f ~/.bash_private ]; then
  . ~/.bash_private
fi

. $BASH_COMPLETION_FILE

if [ -f $BREW_COMPLETION_FILE ]; then
  . $BREW_COMPLETION_FILE
fi

eval "$(pyenv init -)"
