#!/bin/bash

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

if [ ! -f /usr/local/bin/vcprompt ]; then
    echo ""
    echo "Installing vcprompt..."
    echo ""
    curl -s -O https://bitbucket.org/mitsuhiko/vcprompt/get/871f3fbc9c69.zip
    unzip 871f3fbc9c69.zip
    cd mitsuhiko-vcprompt-871f3fbc9c69
    make
    sudo cp vcprompt /usr/local/bin/vcprompt
    sudo chmod +x /usr/local/bin/vcprompt

    cd $DOTFILES

    rm -rf 871f3fbc9c69.zip
    rm -rf mitsuhiko-vcprompt-871f3fbc9c69
fi

echo ""
echo "Please, restart your terminal..."

