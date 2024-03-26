# (Github Dark Default) Colors for Fish shell
set -l comment 8b949e

# Shell highlight groups
# (https://fishshell.com/docs/current/interactive.html#variables-color)

set -g fish_color_normal brwhite  # Default text
set -g fish_color_command brwhite  # 'cd', 'ls', 'echo'
# set -g fish_color_keyword red  # 'if'   NOTE: default = $fish_color_command
set -g fish_color_quote green  # "foo" in 'echo "foo"'
# set -g fish_color_redirection magenta  # '>/dev/null'   NOTE: default = magenta
# set -g fish_color_end blue  # ; in 'cmd1; cmd2'   NOTE: default = blue
# set -g fish_color_error red  # incomplete / non-existent commands   NOTE: default = red
set -g fish_color_param blue  # xvf in 'tar xvf', --all in 'ls --all'
set -g fish_color_comment $comment  # '# a comment' # Question: Where does default come from if not set?
# set -g fish_color_selection --background=$selection # Run 'fish_vi_key_bindings', type some text, <Esc> then 'v' to select text
set -g fish_color_operator red  # * in 'ls ./*'
# set -g fish_color_escape cyan  # ▆ in 'echo ▆' NOTE: default = cyan
set -g fish_color_autosuggestion $comment  # Appended virtual text, e.g. 'cd  ' displaying 'cd ~/some/path'
# set -g fish_color_search_match --background=red   # TODO: How to trigger?

set -g fish_pager_color_completion $fish_color_param # List of suggested items for 'ls <Tab>'
set -g fish_pager_color_description green  # (command) in list of commands for 'c<Tab>'
set -g fish_pager_color_prefix red --underline  # Leading 'c' in list of completions for 'c<Tab>'
set -g fish_pager_color_progress brwhite  # '…and nn more rows' for 'c<Tab>'
set -g fish_pager_color_selected_background --background=$selection # Cursor when <Tab>ing through 'ls <Tab>'