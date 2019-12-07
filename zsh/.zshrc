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
# Configure the environment
# ------------------------------------------------------------------------------
if [ -f /usr/libexec/java_home ]; then
  JAVA_HOME=$(/usr/libexec/java_home)
fi
export BLOCKSIZE=1k
export CLICOLOR=true
export EDITOR=vim
export GIT_EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=false
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto verbose name"
export GOPATH=~/go
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PYENV_VIRTUALENV_DISABLE_PROMPT=true
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export JAVA_HOME


# ------------------------------------------------------------------------------
# Configure the path of the binaries
# ------------------------------------------------------------------------------
path=("/usr/local/opt/python/libexec/bin" $path)
path=("/usr/local/sbin" $path)
path=("$GOPATH/bin" $path)
path=("$HOME/.npm/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("/usr/local/opt/go@1.12/bin" $path)
path=('/usr/local/opt/fzf/bin' $path)


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

eval "$(pyenv init - zsh)"
