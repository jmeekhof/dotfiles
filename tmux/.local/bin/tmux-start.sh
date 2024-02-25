#!/usr/bin/env bash
set -x
session=main
#sessionexists=$(tmux has-session -t $session)


if ! tmux has -t $session; then
	tmux new-session -d -s $session

	# window=1
	# tmux rename-window -t $session:$window 'MPD'
	# tmux send-keys -t $session:$window 'ncmpcpp' C-m

	window=2
	tmux new-window -t $session:$window -c ~/projects/ch -n 'ch'
	# tmux send-keys -t $session:$window 'git fetch --all' C-m
	tmux split-window -t $session:$window -c "#{pane_current_path}"
	tmux send-keys -t $session:$window 'nvim' C-m
fi

tmux attach-session -t $session:1
