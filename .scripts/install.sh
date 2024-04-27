#!/usr/bin/env bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function check_brew() {
	if command -v brew &>/dev/null; then
		echo -e "${GREEN}Homebrew is installed${NC}"
	else
		echo -e "${RED}Homebrew is not installed${NC}"
		echo -e "${YELLOW}Installing Homebrew...${NC}"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
}

function install_brew_packages() {
	echo -e "${YELLOW} Installing homebrew packages ${NC}"
	ln -s "$HOME/.dotfiles/.scripts/Brewfile" "$HOME/Brewfile"
	brew bundle install
}

function install_apt_packages() {
	echo -e "${YELLOW} Installing apt packages ${NC}"
	if command -v apt &>/dev/null; then
		sudo apt install $(grep -vE "^\s*#" ~/.dotfiles/.scripts/apt-packages.txt | tr "\n" " ")
	else
		echo -e "${RED}You are not using ubuntu${NC}"
	fi
}

function install_npm_packages() {
	echo -e "${YELLOW} Installing npm packages ${NC}"
	npm install -g commitizen cz-conventional-changelog
}

function move_config_folders() {
	echo -e "${YELLOW} Moving .config folders to user config directory ${NC}"
	cp -r ../.config/nvim ~/.config/
	cp -r ../.config/tmux ~/.config/
	echo -e "${GREEN} Files are safely moved to user config directory${NC}"
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
		move_config_folders
		break
		;;
	"Run fish configuration script 🐟")
		$(~/.dotfiles/.scripts/fish.sh)
		break
		;;
	"Commando Mode (macOS) 💪")
		check_brew
		move_config_folders
		install_brew_packages
		install_npm_packages
		$(~/.dotfiles/.scripts/fish.sh)
		break
		;;
	"Commando Mode (Ubuntu) 💪")
		install_apt_packages
		move_config_folders
		$(~/.dotfiles/.scripts/fish.sh)
		break
		;;
	*)
		echo -e "${RED}Ooops${NC}"
		;;
	esac
done
