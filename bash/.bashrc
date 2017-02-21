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

  # PS1 parts
  local USER="${COLOR_GREEN}\u${COLOR_OFF}"
  local HOST="${COLOR_PURPLE}\h${COLOR_OFF}"
  local WORKING_DIR="${COLOR_BLUE}\w${COLOR_OFF}"

  PS1="${USER} at ${HOST} in ${WORKING_DIR}"

  if [ "${PYENV_VIRTUALENV}" != "" ]; then
    PS1="${PS1} working on ${COLOR_RED}${PYENV_VIRTUALENV}${COLOR_OFF}"
  fi

  if [ "${GIT_INFO}" != "" ]; then
    PS1="${PS1} ${GIT_INFO}"
  fi

  PS1="${PS1}\n${COLOR_BLUE}\t${COLOR_OFF}"

  if [ "${LAST_STATUS}" == "0" ]; then
    PS1="${PS1} ${COLOR_GREEN}[✔]${COLOR_OFF}";
  else
    PS1="${PS1} ${COLOR_RED}[✘]${COLOR_OFF}";
  fi

  PS1="${PS1} \$: "
}

function pyenv_virtualenv() {
  if [ x$PYENV_VERSION != x ]; then
    echo -n $PYENV_VERSION
  fi
}


# ------------------------------------------------------------------------------
# Setup local variables
# ------------------------------------------------------------------------------
BREW_PREFIX=$(brew --prefix)
GIT_PROMPT_FILE="${BREW_PREFIX}/etc/bash_completion.d/git-prompt.sh"
BASH_COMPLETION_FILE="${BREW_PREFIX}/etc/bash_completion"

# ------------------------------------------------------------------------------
# Setup environment variables
# ------------------------------------------------------------------------------
export PATH=~/.npm-packages/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export GIT_EDITOR=vim
export PROMPT_COMMAND=__prompt_command
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export GIT_PS1_SHOWDIRTYSTATE=1
export VAGRANT_DEFAULT_PROVIDER=virtualbox


# ------------------------------------------------------------------------------
# External scripts
# ------------------------------------------------------------------------------
. ~/.bash_aliases

if [ -f $GIT_PROMPT_FILE ]; then
  . $GIT_PROMPT_FILE
fi

if [ -f $GIT_COMPLETION_FILE ]; then
  . $GIT_COMPLETION_FILE
fi

if [ -f $BASH_COMPLETION_FILE ]; then
  . $BASH_COMPLETION_FILE
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
