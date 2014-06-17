#!/bin/bash

# ----------------------------------------------------------------------------
#
# Install my dotfiles (using symlinks)
#
# ----------------------------------------------------------------------------

DOTFILES_DIR=~/dotfiles
DOTFILES="bashrc bash_profile gitconfig gitignore"

echo "Installing dotfiles"
for file in $DOTFILES; do
    if [ -f ~/".$file" ]; then
        echo "    Removing the old symlink to .$file in home directory."
        rm -rf ~/".$file"
    fi

    echo "    Creating symlink to .$file in home directory."
    ln -s $DOTFILES_DIR/$file ~/".$file"
done

echo "Setting up Sublime Text 3 preferences and packages"
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages
ln -s $DOTFILES_DIR/st3/Packages ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
ln -s $DOTFILES_DIR/st3/Installed\ Packages ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

echo "Loading Bash preferences"
source ~/.bashrc
