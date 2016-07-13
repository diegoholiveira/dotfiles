#!/usr/bin/env bash

# ----------------------------------------------------------------------------
#
# Install my dotfiles (using symlinks)
#
# ----------------------------------------------------------------------------
DOTFILES_DIR=~/dotfiles
DOTFILES="bash_profile gitconfig gitignore vimrc gvimrc tmux.conf"

echo "Installing dotfiles..."
for file in $DOTFILES; do
  if [ -f ~/".$file" ]; then
    echo "    Removing the old symlink to .$file in home directory."
    rm -rf ~/".$file"
  fi

  echo "    Creating symlink to .$file in home directory."
  ln -s $DOTFILES_DIR/$file ~/".$file"
done

