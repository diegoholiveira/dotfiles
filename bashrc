[ -z "$PS1" ] && return

# ----------------------------------------------------------------------------------------
#
# Functions
#
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
#
# Setup environment varibles
#
# ----------------------------------------------------------------------------------------
export EDITOR=vim
export GIT_EDITOR=vim
export PROMPT_COMMAND=__prompt_command
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
export VIM_APP_DIR="/usr/local/Cellar/macvim/7.4-73_1"


# ----------------------------------------------------------------------------------------
#
# External scripts
#
# ----------------------------------------------------------------------------------------
# load the git completion to allow git auto complete
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# load local aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi


# ----------------------------------------------------------------------------------------
#
# Usefull aliases
#
# ----------------------------------------------------------------------------------------
alias mvim="~/dotfiles/bin/mvim"

