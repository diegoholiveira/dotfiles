#!/usr/bin/env bash

# Remove the older vim folder
rm -rf ~/.vim

# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install support for EditorConfig
git clone git://github.com/editorconfig/editorconfig-vim.git ~/.vim/bundle/editorconfig-vim

# Install support for GoLang
git clone git://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

# Install improved support for Javascript
git clone git://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript

# Install Syntastic
git clone git://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

# Install solarized
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

# Install gitgutter
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter

# Install CtrlP
git clone git://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

