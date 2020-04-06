# ------------------------------------------------------------------------------
# Configure the environment
# ------------------------------------------------------------------------------
if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
export BAT_CONFIG_PATH=~/.bat.conf
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
export TERM=xterm-256color-italic
