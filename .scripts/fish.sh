#!/usr/bin/env fish

set CONFIG_PATH ~/.config/fish
set BASE_DIR $HOME/.dotfiles/.config/fish
ln -s "$BASE_DIR/config.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-osx.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-windows.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-linux.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/functions/fzf_change_directory.fish" "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/functions/fish_user_key_bindings.fish" "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/conf.d/tide.fish" "$CONFIG_PATH/conf.d/"

echo "Installing z"
fisher install jethrokuan/z

# Mind the compatibility: https://github.com/IlanCosman/tide/wiki/Fish-version-compatibility
echo "Installing a theme for fish"
fisher install IlanCosman/tide

echo "Installing edc bazz"
fisher install edc/bass

echo "Installign ssh-agent"
echo installing ssh-agent
fisher install danhper/fish-ssh-agent

echo "Installing nvm"
fisher install jorgebucaran/nvm.fish

echo "Installing fzf"
fisher install PatrickF1/fzf.fish
