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
path=("/usr/local/opt/python/libexec/bin" $path)
path=("$PYENV_ROOT/bin" $path)
path=("/usr/local/opt/ruby@3.1/bin" $path)


# ------------------------------------------------------------------------------
# Colors: Nord Theme
# ------------------------------------------------------------------------------
if [ -f ~/.dir_colors ]; then
  eval "$(gdircolors -b ~/.dir_colors)"
fi
colors


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


source ~/.cargo/env
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(/usr/local/bin/starship init zsh --print-full-init)
source <(pyenv init -)
source <(/usr/local/bin/brew shellenv)
source <(aws configure export-credentials --format env)

eval "$(direnv hook zsh)"

# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/diegoholiveira/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
