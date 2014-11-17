parse_git_branch () {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

parse_git_tag () {
    git describe --tags 2> /dev/null
}

parse_git_branch_or_tag () {
    local OUT="$(parse_git_branch)"
    if [ "$OUT" == "((no branch))" ];
    then
        OUT="($(parse_git_tag))";
    fi
    echo $OUT
}

#
# Source: http://stackoverflow.com/questions/16715103/bash-prompt-with-last-exit-code
#
function __prompt_command() {
    # last status code
    local EXIT="$?"

    #
    # ANSI color code
    #
    local Color_Off="\[\033[0m\]"
    # regular colors
    local Red="\[\033[0;31m\]"
    local Green="\[\033[0;32m\]"

    PS1=""

    if [ $EXIT -eq 0 ]; then
        PS1+="$Green[✔]$Color_Off ";
    else
        PS1+="$Red[✘]$Color_Off ";
    fi

    PS1+="$Green\$(parse_git_branch_or_tag)$Color_Off \h:\w \$: "
}

export PROMPT_COMMAND=__prompt_command
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

source ~/dotfiles/osx_rc

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# Allows me to loads other configurations on my workstation at the office
if [ -f ~/.bash_local ]; then
    source ~/.bash_local
fi
