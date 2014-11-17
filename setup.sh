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

echo "Setting up git autocomplete"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

echo "Setting up Sublime Text 3 preferences and packages"
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages
ln -s $DOTFILES_DIR/st3/Packages ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
ln -s $DOTFILES_DIR/st3/Installed\ Packages ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

# Use a modified version of the Solarized Light theme by default in Terminal.app
echo "Setting up iterm2 and terminal.app"
TERM_PROFILE='Solarized Light xterm-256color';
CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
    open "${HOME}/dotfiles/terminal/${TERM_PROFILE}.terminal";
    sleep 1; # Wait a bit to make sure the theme is loaded
    defaults write com.apple.terminal 'Default Window Settings' -string "${TERM_PROFILE}";
    defaults write com.apple.terminal 'Startup Window Settings' -string "${TERM_PROFILE}";
fi;

# Install the Solarized Light theme for iTerm
open "${HOME}/dotfiles/iterm2/Solarized Light.itermcolors"

echo "Loading Bash preferences"
source ~/.bashrc
