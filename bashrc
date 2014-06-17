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

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

export PS1="\[\e[32m\]\$(parse_git_branch_or_tag)\[\e[34m\]\h:\W \$ \[\e[m\]"

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
