#!/usr/bin/env fish

set CONFIG_PATH ~/.config/fish
set BASE_DIR $HOME/.dotfiles/.config/fish

if test -d "$CONFIG_PATH"
  echo "Removing Existing Config Files for fish"
  rm -rf "$CONFIG_PATH"
  echo "Making Necessary Directories for fish"
  mkdir "$CONFIG_PATH/"
  mkdir "$CONFIG_PATH/functions/"
  mkdir "$CONFIG_PATH/conf.d/"
end

echo "Copying files to config path"
ln -s "$BASE_DIR/config.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-osx.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-windows.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-linux.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/functions/fzf_change_directory.fish" "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/functions/fish_user_key_bindings.fish" "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/conf.d/tide.fish" "$CONFIG_PATH/conf.d/"

# Check if fisher is installed
if not functions -q fisher
    echo "fisher is not installed. Installing fisher..."
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    echo "fisher installed successfully."
    cp -rf fish_plugins "$CONFIG_PATH"
    fish -c "fisher update"
end


