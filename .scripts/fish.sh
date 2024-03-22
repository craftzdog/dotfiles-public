#! /usr/bin/env fish

set CONFIG_PATH ~/.config/fish
set BASE_DIR $HOME/.dotfiles/.config/fish
ln -s "$BASE_DIR/config.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-osx.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-windows.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-linux.fish" "$CONFIG_PATH"
mkdir "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/functions/fzf_change_directory.fish" "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/functions/fish_user_key_bindings.fish" "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/conf.d/tide.fish" "$CONFIG_PATH/conf.d/"

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

cp -rf ~/.dotfiles/.scripts/fish_plugins ~/.config/fish/

fisher update
