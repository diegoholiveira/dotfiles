# ------------------------------------------------------------------------------
# Auto Complete
# ------------------------------------------------------------------------------
fpath=(/opt/homebrew/share/zsh-completions $fpath)


# ------------------------------------------------------------------------------
# Configure zsh
# ------------------------------------------------------------------------------
zstyle :compinstall filename '/Users/diegoholiveira/.zshrc'

autoload -Uz compinit
autoload -U colors
compinit


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
path=("/opt/homebrew/sbin" $path)
path=("/opt/homebrew/bin" $path)
path=("$HOME/dotfiles/bin" $path)
path=("$GOPATH/bin" $path)
path=("$HOME/.npm/bin" $path)


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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.zsh_private ]; then
  . ~/.zsh_private
fi

if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(/usr/local/bin/starship init zsh --print-full-init)
source <(aws configure export-credentials --format env)
source ~/.rye/env

eval "$(direnv hook zsh)"
