#!/bin/bash

# Remove the older vim folder
rm -rf ~/.vim

# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install support for EditorConfig
git clone git@github.com:editorconfig/editorconfig-vim.git ~/.vim/bundle/editorconfig-vim

# Install support for GoLang
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

# Install Syntastic
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

# Install solarized
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

# Install gitgutter
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter

# Install CtrlP
git clone git@github.com:kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

# Install support for API Blueprint format
git clone https://github.com/kylef/apiblueprint.vim.git ~/.vim/bundle/apiblueprint.vim

