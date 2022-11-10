set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# common aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"

alias h="history"
alias vim="nvim"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"
alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias pyenv86="arch -x86_64 pyenv"

command -qv nvim && alias vim nvim

# git aliases
alias g git
alias gchk = "git checkout"
alias gp = "git pull"

# docker aliases
alias dkr "docker"
alias dcm "docker-compose"

# vscode aliases
alias vs="code"

# python aliases
alias python="python3"
alias pip="pip3"
alias supe="sudo pipenv"
alias pe="pipenv"
alias per="pipenv run"

# rust, cargo
alias rtc="rustc"
alias cg="cargo"
alias cgb="cargo build"
alias cgr="cargo run"

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
