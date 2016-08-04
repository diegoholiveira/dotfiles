#!/usr/bin/env bash
DOTFILES_DIR=~/dotfiles

# Install homebrew
if [ ! -f /usr/local/bin/brew ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install basic packages
PACKAGES="bash bash-completion git python pyenv pyenv-virtualenv tmux stow vcprompt"
PACKAGES="$PACKAGES ssh-copy-id tree"
for PKG in $PACKAGES; do
  if brew list -1 | grep -q "^${PKG}\$"; then
    brew upgrade $PKG
  else
    brew install $PKG
  fi
done

# Install or Upgrade macvim
if brew list -1 | grep -q "^macvim\$"; then
  brew upgrade macvim --env-std --with-override-system-vim --python
else
  brew install macvim --env-std --with-override-system-vim --python
fi

# Link macvim to the apps
brew linkapps macvim

# Add the new shell to the list of allowed shells
grep -q "/usr/local/bin/bash" /etc/shells
if [ $? -ne 0 ]; then
  sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
fi

# Upgrade pip and setuptools
pip install --upgrade pip setuptools

# ----------------------------------------------------------------------------
# Clone the repository to the machine if it's not there yet
# ----------------------------------------------------------------------------
if [ ! -d $DOTFILES_DIR ]; then
   git clone https://github.com/diegoholiveira/dotfiles.git $DOTFILES_DIR
fi

cd $DOTFILES_DIR
for APP in "bash git tmux vim"; do
  stow $APP
done

# Setup vim
. $DOTFILES_DIR/vim_setup.sh

# change to the new shell
if [ "$SHELL" == "/bin/bash" ]; then
  chsh -s /usr/local/bin/bash
fi

. ~/.bash_profile

