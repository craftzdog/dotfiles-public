#!/bin/bash

set -e

check_package() {
    if ! type "$1" > /dev/null 2>&1; then
        echo "'$1' is not found, please install it first!"
    fi
}

# Check whether curl is installed
check_package curl
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    rm -rf $HOME/.zshrc
fi

# Check whether exa is installed
check_package exa
# Check whether zoxide is installed
check_package zoxide
# Check whether starship is installed
check_package starship

echo "Linking dotfiles..."
DOTFILES_DIR="$(pwd)"
ln -s ${DOTFILES_DIR}/.zshrc $HOME/.zshrc
ln -s ${DOTFILES_DIR}/.oh-my-zsh/custom/peco.zsh $HOME/.oh-my-zsh/custom/peco.zsh
ln -s ${DOTFILES_DIR}/.gitconfig $HOME/.gitconfig
ln -s ${DOTFILES_DIR}/.config/nvim $HOME/.config/nvim
ln -s ${DOTFILES_DIR}/.config/tmux $HOME/.config/tmux
ln -s ${DOTFILES_DIR}/.ssh/config $HOME/.ssh/config
echo "Done!"