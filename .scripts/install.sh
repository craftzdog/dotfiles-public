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
	brew bundle install --file=./brewfile
}

function install_apt_packages() {
	echo -e "${YELLOW} Installing apt packages ${NC}"
	if command -v apt &>/dev/null; then
		sudo apt install fish exa fzf fd-find ripgrep
	else
		echo -e "${RED}You are not using ubuntu${NC}"
	fi
}

function install_npm_packages() {
	echo -e "${YELLOW} Installing npm packages ${NC}"
	sudo npm install -g commitizen cz-conventional-changelog
}

function move_config_folders() {
	echo -e "${YELLOW} Moving .config folders to home directory ${NC}"
	cp -r ../.config ~/
	echo -e "${GREEN} Files are safely moved to home directory${NC}"
}

echo -e "${YELLOW}Welcome to craftsdog setup installation script.${NC}"

PS3="Select your option: "

select option in "Install Homebrew and packages 📦" "Install Ubuntu packages 📦" "Install npm packages 📦" "Move .config folders to home directory ⬅️" "Run fish configuration script 🐟" "Commando Mode (macOS) 💪" "Commando Mode (Ubuntu) 💪" "Quit ❌"; do
	case $option in
	"Install Homebrew and packages 📦")
		check_brew
		install_brew_packages
		;;
	"Install Ubuntu packages 📦")
		install_apt_packages
		;;
	"Install npm packages 📦")
		install_npm_packages
		;;
	"Move .config folders to home directory ⬅️")
		move_config_folders
		;;
	"Run fish configuration scrip 🐟")
		./fish.sh
		;;
	"Commando Mode (macOS) 💪")
		check_brew
		move_config_folders
		install_brew_packages
		install_npm_packages
		./fish.sh
		;;
	"Commando Mode (Ubuntu) 💪")
		install_apt_packages
		move_config_folders
		;;
	"Quit ❌")
		echo -e "${GREEN}We're done${NC}"
		break
		;;
	*)
		echo -e "${RED}Ooops${NC}"
		;;
	esac
done
