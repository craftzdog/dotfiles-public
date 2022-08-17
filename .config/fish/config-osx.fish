set -gx PATH /opt/homebrew/bin $PATH

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

