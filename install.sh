#!/bin/bash

set -e

check_package() {
    if ! type "$1" > /dev/null 2>&1; then
        echo "'$1' is not found, please install it first!"
    fi
}

check_package curl
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf ~/.zshrc

#Check whether exa is installed
check_package exa
#Check whether zoxide is installed
check_package zoxide

ln -s ~/.zshrc ~/.dotfiles/.zshrc
ln -s ~/.oh-my-zsh/custom/peco.zsh ~/.oh-my-zsh/custom/peco.zsh

ln -s ~/.gitconfig ~/.gitconfig

ln -s ~/.config/nvim ~/.config/nvim
ln -s ~/.config/tmux ~/.config/tmux

ln -s ~/.ssh/config ~/.ssh/config

check_package starship
starship preset nerd-font-symbols > ~/.config/starship.toml
