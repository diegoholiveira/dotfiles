# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/dhenrique/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# ------------------------------------------------------------------------------
# Auto Complete
# ------------------------------------------------------------------------------
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/functions $fpath)

autoload -Uz $(ls ~/.zsh/functions)
autoload -U colors


# ------------------------------------------------------------------------------
# Configure the path of the binaries
# ------------------------------------------------------------------------------
path=("/usr/local/opt/python/libexec/bin" $path)
path=("/usr/local/sbin" $path)
path=("$GOPATH/bin" $path)
path=("$HOME/.npm/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("/usr/local/opt/go@1.12/bin" $path)
path=("/usr/local/opt/fzf/bin" $path)
path=("$HOME/.cargo/bin" $path)


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
pyenv_info () {
  env=$(pyenv version-name)
  if [ "${env}" != "system" ];then
    echo "working on ${env} "
  else
    echo ""
  fi
}

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

setopt prompt_subst

PROMPT='%{$fg[blue]%}%~%{$reset_color%} %{$fg[red]%}$(pyenv_info)%{$reset_color%}$(__git_ps1 "(%s)")
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


# ------------------------------------------------------------------------------
# Source other configurations
# ------------------------------------------------------------------------------
. ~/.fzf

if [ -f ~/.zsh_private ]; then
  . ~/.zsh_private
fi

eval "$(pyenv init - zsh)"