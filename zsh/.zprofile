# ------------------------------------------------------------------------------
# Configure the environment
# ------------------------------------------------------------------------------
if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
export BAT_CONFIG_PATH=~/.bat.conf
export BLOCKSIZE=1k
export BUN_INSTALL="$HOME/.bun"
export CLICOLOR=true
export EDITOR=vim
export GIT_EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=false
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto verbose name"
export GOPATH=~/.go
export HOMEBREW_NO_ENV_HINTS=true
export JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION=true
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export STARSHIP_CONFIG=~/.starship.toml
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)
export XDG_CONFIG_HOME=~/.config
