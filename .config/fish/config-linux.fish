if type -q eza
  alias ll "eza -l -g --icons"
  alias lla "ll -a"
end

# Initial starship
starship init fish | source
# Initial zoxide
zoxide init fish | source