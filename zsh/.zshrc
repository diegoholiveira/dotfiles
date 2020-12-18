# ------------------------------------------------------------------------------
# Auto Complete
# ------------------------------------------------------------------------------
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/functions $fpath)

autoload -Uz $(ls ~/.zsh/functions)
autoload -U colors

# ------------------------------------------------------------------------------
# Configure up and down to search the history
# ------------------------------------------------------------------------------
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


# ------------------------------------------------------------------------------
# Configure the path of the binaries
# ------------------------------------------------------------------------------
path=("/usr/local/sbin" $path)
path=("$GOPATH/bin" $path)
path=("$HOME/.npm/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("/usr/local/opt/fzf/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("/usr/local/opt/go@1.14/bin" $path)
path=("/usr/local/opt/node@10/bin" $path)
path=("/usr/local/opt/python@3.9/libexec/bin" $path)


# ------------------------------------------------------------------------------
# Colors: Nord Theme
# ------------------------------------------------------------------------------
if [ -f ~/.dir_colors ]; then
  eval "$(gdircolors -b ~/.dir_colors)"
fi
colors


# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

setopt prompt_subst

PROMPT='%{$fg[blue]%}%~%{$reset_color%} %{$fg[red]%}$(prompt-pyenv)%{$reset_color%}$(__git_ps1 "(%s)")
%(?.%{$fg[green]%}%#%{$reset_color%}.%{$fg[red]%}%#%{$reset_color%}) '


# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias cp="cp -iv"
alias ls="gls --color=auto -AlhF"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias rm="rm -iv"
alias tailf="tail -f"
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"


# ------------------------------------------------------------------------------
# Source other configurations
# ------------------------------------------------------------------------------
. ~/.fzf

if [ -f ~/.zsh_private ]; then
  . ~/.zsh_private
fi

if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi


eval "$(pyenv init - zsh)"

# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/dhenrique/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
