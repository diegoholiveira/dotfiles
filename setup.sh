#!/bin/bash

# ----------------------------------------------------------------------------
#
# Install Brew
#
# ----------------------------------------------------------------------------

if [ ! -f /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# ----------------------------------------------------------------------------
#
# Install git and gitflow
#
# ----------------------------------------------------------------------------
brew install git


# ----------------------------------------------------------------------------
#
# Install Python
#
# ----------------------------------------------------------------------------
brew install python


# ----------------------------------------------------------------------------
#
# Update pip and setuptools
#
# ----------------------------------------------------------------------------
pip install --upgrade pip setuptools


# ----------------------------------------------------------------------------
#
# Install MacVim
#
# ----------------------------------------------------------------------------
brew install macvim --env-std --override-system-vim -—python


# ----------------------------------------------------------------------------
#
# Install vcprompt
#
# ----------------------------------------------------------------------------
brew install vcprompt


# ----------------------------------------------------------------------------
#
# Clone the repository to the machine if it's not there yet
#
# ----------------------------------------------------------------------------
if [ ! -d ~/dotfiles ]; then
   cd ~/
   git clone https://github.com/diegoholiveira/dotfiles.git
fi

if [ ! -f ~/.git-completion.bash ]; then
    echo ""
    echo "Setting up git autocomplete..."
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash &> /dev/null
fi

# Setup dotfile
. $DOTFILES_DIR/configure_links.sh

# Setup vim
. $DOTFILES_DIR/configure_vim.sh

. ~/.bash_profile

