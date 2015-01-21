#!/bin/bash

# ----------------------------------------------------------------------------
#
# Install my dotfiles (using symlinks)
#
# ----------------------------------------------------------------------------

DOTFILES_DIR=~/dotfiles
DOTFILES="bashrc bash_profile gitconfig gitignore vimrc gvimrc"

echo "Installing dotfiles"
for file in $DOTFILES; do
    if [ -f ~/".$file" ]; then
        echo "    Removing the old symlink to .$file in home directory."
        rm -rf ~/".$file"
    fi

    echo "    Creating symlink to .$file in home directory."
    ln -s $DOTFILES_DIR/$file ~/".$file"
done

# creating an alias to my vim files
ln -s $DOTFILES_DIR/vim ~/.vim

echo "Setting up git autocomplete"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash &> /dev/null

if [[ "$OSTYPE" == darwin* ]]; then

	# Install the Solarized Light theme for iTerm2
	open "$DOTFILES_DIR/iterm2/Solarized Light.itermcolors"

	echo "Setting up my macos preferences"
	source ~/dotfiles/osx_rc
fi

echo "Please, restart your terminal..."

