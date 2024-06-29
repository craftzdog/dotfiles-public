#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function check_command_execution() {
	# Checks if the previous command executed successfully
	if [ $? -eq 0 ]; then
		echo -e "${GREEN}Successfully installed $1${NC}"
	else
		echo -e "${RED}Failed to install $1${NC}"
	fi
}

function check_brew() {
	if command -v brew &>/dev/null; then
		echo -e "${GREEN}Homebrew is installed${NC}"
	else
		echo -e "${RED}Homebrew is not installed${NC}"
		echo -e "${YELLOW}Installing Homebrew...${NC}"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		check_command_execution "homebrew"
	fi
}

function install_brew_packages() {
	echo -e "${YELLOW} Installing homebrew packages ${NC}"
	ln -s "$HOME/.dotfiles/.scripts/Brewfile" "$HOME/Brewfile"
	brew bundle install
	check_command_execution "homebrew packages"
}

function install_apt_packages() {
	echo -e "${YELLOW} Installing apt packages ${NC}"
	if command -v apt &>/dev/null; then
		sudo apt install "$(grep -vE "^\s*#" ~/.dotfiles/.scripts/apt-packages.txt | tr "\n" " ")"
		check_command_execution "apt packages"
	else
		echo -e "${RED}You are not using ubuntu${NC}"
	fi
}

function install_npm_packages() {
	echo -e "${YELLOW} Installing npm packages ${NC}"
	npm install -g commitizen cz-conventional-changelog
	check_command_execution "npm packages"
}

function move_config_folders_and_dotfiles() {
	echo -e "${YELLOW} Moving .config folders and dotfiles to user config directory ${NC}"

	# Neovim
	if [ -e ~/.config/nvim ]; then
		echo -e "${RED}Removing older neovim config ${NC}"
		rm -rf ~/.config/nvim/
		echo -e "${YELLOW}Copying neovim directory to home directory${NC}"
		cp -r ~/.dotfiles/.config/nvim ~/.config/
		echo -e "${GREEN}Successfully copied neovim to home directory"
	else
		echo -e "${YELLOW}Copying neovim directory to home directory${NC}"
		cp -r ~/.dotfiles/.config/nvim ~/.config/
		echo -e "${GREEN}Successfully copied neovim to home directory"
	fi

	# Tmux
	if [ -e ~/.config/tmux ]; then
		echo -e "${RED}Removing older tmux config ${NC}"
		rm -rf ~/.config/tmux/
		echo -e "${YELLOW}Copying tmux directory to home directory${NC}"
		cp -r ~/.dotfiles/.config/tmux ~/.config/
		echo -e "${GREEN}Successfully copied tmux to home directory"
	else
		echo -e "${YELLOW}Copying tmux directory to home directory${NC}"
		cp -r ~/.dotfiles/.config/tmux ~/.config/
		echo -e "${GREEN}Successfully copied tmux to home directory"
	fi

	# Lazygit
	if [ -e ~/.config/lazygit ]; then
		echo -e "${RED}Removing older lazygit config ${NC}"
		rm -rf ~/.config/lazygit/
		echo -e "${YELLOW}Copying lazygit directory to home directory${NC}"
		cp -r ~/.dotfiles/.config/lazygit ~/.config/
		echo -e "${GREEN}Successfully copied lazygit to home directory"
	else
		echo -e "${YELLOW}Copying lazygit directory to home directory${NC}"
		cp -r ~/.dotfiles/.config/lazygit ~/.config/
		echo -e "${GREEN}Successfully copied lazygit to home directory"
	fi

	# czrc
	if [ -e ~/.config/.czrc ]; then
		echo -e "${RED}Removing older .czrc config ${NC}"
		rm -rf ~/.config/.czrc/
		echo -e "${YELLOW}Copying .czrc directory to home directory${NC}"
		cp -r ~/.dotfiles/.config/.czrc ~/.config/
		echo -e "${GREEN}Successfully copied .czrc to home directory"
	else
		echo -e "${YELLOW}Copying .czrc directory to home directory${NC}"
		cp -r ~/.dotfiles/.config/.czrc ~/.config/
		echo -e "${GREEN}Successfully copied .czrc to home directory"
	fi

}

echo -e "${YELLOW}Welcome to craftsdog setup installation script.${NC}"

PS3="Select your option: "

options=("Install Homebrew and packages 🍺" "Install Ubuntu packages 📦" "Install npm packages 📦" "Move .config folders to user config directory ⬅️" "Run fish configuration script 🐟" "Commando Mode (macOS) 💪" "Commando Mode (Ubuntu) 💪")

select SELECTED_OPTION in "${options[@]}"; do
	case "${SELECTED_OPTION}" in
	"Install Homebrew and packages 🍺")
		check_brew
		install_brew_packages
		break
		;;
	"Install Ubuntu packages 📦")
		install_apt_packages
		break
		;;
	"Install npm packages 📦")
		install_npm_packages
		break
		;;
	"Move .config folders to user config directory ⬅️")
		move_config_folders_and_dotfiles
		break
		;;
	"Run fish configuration script 🐟")
		~/.dotfiles/.scripts/fish.sh
		break
		;;
	"Commando Mode (macOS) 💪")
		check_brew
		move_config_folders_and_dotfiles
		install_brew_packages
		install_npm_packages
		~/.dotfiles/.scripts/fish.sh
		break
		;;
	"Commando Mode (Ubuntu) 💪")
		install_apt_packages
		move_config_folders_and_dotfiles
		~/.dotfiles/.scripts/fish.sh
		break
		;;
	*)
		echo -e "${RED}Ooops${NC}"
		;;
	esac
done
