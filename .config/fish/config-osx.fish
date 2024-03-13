set -gx PATH /opt/homebrew/bin $PATH

if type -q exa
  alias ll "eza -l -g --icons"
  alias lla "ll -a"
end

# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

# Initial starship
starship init fish | source
# Initial zoxide
zoxide init fish | source