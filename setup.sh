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
brew install git git-flow


# ----------------------------------------------------------------------------
#
# Install Python
#
# ----------------------------------------------------------------------------
brew install python
# Update pip and setuptools
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
# Install drafter (To assist in API Blueprint files)
#
# ----------------------------------------------------------------------------
brew install --HEAD https://raw.github.com/apiaryio/drafter/master/tools/homebrew/drafter.rb


# ----------------------------------------------------------------------------
#
# Clone the repository to the machine if it's not there yet
#
# ----------------------------------------------------------------------------
if [ ! -d ~/dotfiles ]; then
   cd ~/
   git clone https://github.com/diegoholiveira/dotfiles.git
fi

# ----------------------------------------------------------------------------
#
# Install my dotfiles (using symlinks)
#
# ----------------------------------------------------------------------------
DOTFILES_DIR=~/dotfiles
DOTFILES="bash_profile gitconfig gitignore vimrc gvimrc"

echo "Installing dotfiles..."
for file in $DOTFILES; do
    if [ -f ~/".$file" ]; then
        echo "    Removing the old symlink to .$file in home directory."
        rm -rf ~/".$file"
    fi

    echo "    Creating symlink to .$file in home directory."
    ln -s $DOTFILES_DIR/$file ~/".$file"
done

if [ ! -f ~/.git-completion.bash ]; then
    echo ""
    echo "Setting up git autocomplete..."
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash &> /dev/null
fi

# Setup vim
source $DOTFILES_DIR/configure_vim.sh

echo ""
echo "Please, restart your terminal..."

