#!/bin/bash

read -p "Enter the directory path: " path
cd "$(path)"

# Start a new tmux session with name "ide"
tmux new-session -s ide -d

# Create a new window named "editor"
tmux rename-window -t ide:0 -n editor

# Create a new window named "terminal"
tmux new-window -t ide:1 -n terminal

# Split the second window vertically into two panes
tmux split-window -t ide:1 -v

# Rename the first vertical pane to "directory"
tmux select-pane -t ide:1.0 -T directory

# Rename the second vertical pane to "shell"
tmux select-pane -t ide:1.1 -T shell

# Split the "shell" pane horizontally into two more panes
tmux split-pane -t ide:1.1 -h

# Attach to the "ide" session
tmux select-window -t ide:0
tmux attach-session -t ide
