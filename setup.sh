#!/bin/bash

# ----------------------------------------------------------------------------
#
# Install my dotfiles (using symlinks)
#
# ----------------------------------------------------------------------------

DOTFILES_DIR=~/dotfiles
DOTFILES="bashrc bash_profile gitconfig gitignore"

for file in $DOTFILES; do
    if [ -f ~/".$file" ]; then
        echo "Removing the old symlink to .$file in home directory."
        rm -rf ~/".$file"
    fi

    echo "Creating symlink to .$file in home directory."
    ln -s $DOTFILES_DIR/$file ~/".$file"
done

source ~/.bashrc
