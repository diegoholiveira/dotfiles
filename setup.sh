#!/usr/bin/env bash

# Environment variables
BREW_PKGS="ansible bash bash-completation git python pyenv pyenv-virtualenv"
BREW_PKGS="${BREW_PKGS} tree tmux stow vcprompt ssh-copy-id rust scala sbt"
BREW_PKGS="${BREW_PKGS} node npm php70 composer"
CASK_APPS="iterm2 firefox spotify phpstorm pycharm send-to-kindle unrarx"
CASK_APPS="${CASK_APPS} docker vagrant virtualbox asepsis sequel-pro"
DOTFILES_DIR=~/dotfiles
NODE_GLOBAL_PKGS="nvm eslint eslint-config-airbnb eslint-plugin-jsx-a11y"
NODE_GLOBAL_PKGS="${NODE_GLOBAL_PKGS} eslint-plugin-react eslint-plugin-import"
PHPCS_DIR=~/.composer/vendor/squizlabs/php_codesniffer
PHPCS_BIN="${PHPCS_DIR}/scripts/phpcs"
STOW_FILES="bash git tmux vim eslint"
VIM_PLUGINS="editorconfig/editorconfig-vim rust-lang/rust.vim pangloss/vim-javascript"
VIM_PLUGINS="${VIM_PLUGINS} scrooloose/syntastic altercation/vim-colors-solarized"
VIM_PLUGINS="${VIM_PLUGINS} airblade/vim-gitgutter kien/ctrlp.vim derekwyatt/vim-scala"

# Clean old Vim files
if [ -d ~/.vim ]; then
  # Remove the older vim folder
  rm -rf ~/.vim
fi

# Create vim folders to install plugins
mkdir -p ~/.vim/{autoload,bundle}

# Install Xcode command line tools
xcode-select -p &> /dev/null
if [ ! $? ]; then
  xcode-select --install
fi

# Install Homebrew
if [ ! -f /usr/local/bin/brew ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

# Install Cask
if brew tap | grep -q "caskroom/cask"; then
  brew cask update
else
  brew tap caskroom/cask
fi

# Tap homebrew/php
brew tap | grep -q "homebrew/php"
if [ ! $? ]; then
  brew tap homebrew/php
fi

# Install Cask apps
for APP in $CASK_APPS; do
  brew cask install $APP
done

# Install Brew packages
for PKG in $BREW_PKGS; do
  if brew list -1 | grep -q "^${PKG}\$"; then
    brew update $PKG
  else
    brew install $PKG
  fi
done

# Replace the system vim for a better vim
if brew list -1 | grep -q "^macvim\$"; then
  brew unlinkapps macvim
  brew update macvim --with-override-system-vim
else
  brew install macvim --with-override-system-vim
fi

# Link macvim to the apps
brew linkapps macvim

# Install Pathogen to manage vim plugins
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Get my vim plugins
cd ~/.vim/bundle
for PLUGIN in $VIM_PLUGINS; do
  git clone "git://github.com/${PLUGIN}.git"
done
cd -

# Install global packages using NPM
for PKG in NODE_GLOBAL_PKGS; do
  npm install -g ${PKG}
done

# Clone the repository into the dotfiles dir
if [ ! -d $DOTFILES_DIR ]; then
  git clone https://github.com/diegoholiveira/dotfiles.git $DOTFILES_DIR
fi

# Link the profiles to my versions
for APP in $STOW_FILES; do
  stow --dir=${DOTFILES_DIR} ${APP}
done

# Import iTerm2 configs
defaults import com.googlecode.iterm2 ${DOTFILES_DIR}/iterm2.plist

# Add the new shell to the list of allowed shells
grep -q "/usr/local/bin/bash" /etc/shells
if [ $? -ne 0 ]; then
  sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
fi

# change to the new shell
if [ "$SHELL" == "/bin/bash" ]; then
  chsh -s /usr/local/bin/bash
fi

# Start using the new bash profile
. ~/.bash_profile

# Install php code sniffer
if [ ! -d $PHPCS_DIR ]; then
  composer global require "squizlabs/php_codesniffer=@stable"
fi

# Creates an symlink to PHPCS_BIN in /usr/local/bin
if [ -e /usr/local/bin/phpcs ]; then
  ln -s $PHPCS_BIN /usr/local/bin/phpcs
fi

# Upgrade pip and setuptools
pip install --upgrade pip setuptools

# Generates a ssh key for my user
if [ -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "contato@diegoholiveira.com" -N "" -f ~/.ssh/id_rsa -q
fi

echo "------------------------------------------------------------------------------"
echo "Final instructions"
echo "------------------------------------------------------------------------------"
echo ""
echo "To secure your ssh key, please add a passphrase to it using the command above:"
echo "    ssh-keygen -p -f ~/.ssh/id_rsa"
echo ""

