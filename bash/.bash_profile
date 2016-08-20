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
  VIRTUALENV=`pyenv_virtualenv`

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

function pyenv_virtualenv() {
  if [ x$PYENV_VERSION != x ]; then
    echo -n $PYENV_VERSION
  fi
}


# ----------------------------------------------------------------------------------------
# Setup environment variables
# ----------------------------------------------------------------------------------------
export PATH=/usr/local/bin:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=screen-256color-bce
export EDITOR=vim
export GIT_EDITOR=vim
export PROMPT_COMMAND=__prompt_command
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
export PYENV_ROOT=/usr/local/var/pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


# ----------------------------------------------------------------------------------------
# External scripts
# ----------------------------------------------------------------------------------------
BREW_PREFIX=$(brew --prefix)
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
  . $BREW_PREFIX/etc/bash_completion
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(thefuck --alias)"

if [ -e ~/.aliases ]; then
  . ~/.aliases
fi

