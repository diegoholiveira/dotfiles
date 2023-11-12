# ------------------------------------------------------------------------------
# Auto Complete
# ------------------------------------------------------------------------------
fpath=(/usr/local/share/zsh-completions $fpath)


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
path=("$HOME/dotfiles/bin" $path)
path=("/usr/local/sbin" $path)
path=("$GOPATH/bin" $path)
path=("$HOME/.npm/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("/usr/local/opt/fzf/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("$PYENV_ROOT/bin" $path)
path=("/usr/local/opt/python@3.11/libexec/bin" $path)
path=("/usr/local/opt/python@3.11/bin" $path)
path=("/usr/local/opt/ruby@3.1/bin" $path)
path=("/usr/local/opt/postgresql@15/bin" $path)


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
source <(aws configure export-credentials --format env)
source <(pkgx --shellcode)

eval "$(direnv hook zsh)"


