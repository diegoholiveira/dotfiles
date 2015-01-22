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
# Install MacVim
#
# ----------------------------------------------------------------------------
if [ ! -f /usr/local/bin/mvim ]; then
    brew install  macvim --env-std --override-system-vim —python
fi


# ----------------------------------------------------------------------------
#
# Install git and gitflow
#
# ----------------------------------------------------------------------------

if [ ! -f /usr/local/bin/git ]; then
    brew install git git-flow
fi


# ----------------------------------------------------------------------------
#
# Install vcprompt
#
# ----------------------------------------------------------------------------
if [ ! -f /usr/local/bin/vcprompt ]; then
    brew install vcprompt
fi


# ----------------------------------------------------------------------------
#
# Install my dotfiles (using symlinks)
#
# ----------------------------------------------------------------------------

DOTFILES_DIR=~/dotfiles
DOTFILES="bashrc bash_profile gitconfig gitignore vimrc gvimrc"

echo "Installing dotfiles..."
for file in $DOTFILES; do
    if [ -f ~/".$file" ]; then
        echo "    Removing the old symlink to .$file in home directory."
        rm -rf ~/".$file"
    fi

    echo "    Creating symlink to .$file in home directory."
    ln -s $DOTFILES_DIR/$file ~/".$file"
done

# Remove the older vim folder
rm -rf ~/.vim
# creating an alias to my vim files
ln -s $DOTFILES_DIR/vim ~/.vim

if [ ! -f ~/.git-completion.bash ]; then
    echo ""
    echo "Setting up git autocomplete..."
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash &> /dev/null
fi

echo ""
echo "Please, restart your terminal..."

