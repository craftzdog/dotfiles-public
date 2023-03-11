#!/bin/bash

set -e

file_list = "~/.zshrc \
    ~/.oh-my-zsh/custom/peco.zsh \
    ~/.giconfig \
    ~/.config/nvim \
    ~/.config/tmux \
    ~/.ssh/config \
    ~/.config/starship.toml"

rm -rf ${file_list}
