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

