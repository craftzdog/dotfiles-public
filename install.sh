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

echo "Linking dotfiles..."
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfile/.oh-my-zsh/custom/peco.zsh ~/.oh-my-zsh/custom/peco.zsh
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/.config/tmux ~/.config/tmux
ln -s ~/.dotfiles/.ssh/config ~/.ssh/config
echo "Done!"

check_package starship
starship preset nerd-font-symbols > ~/.config/starship.toml
