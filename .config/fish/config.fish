if status is-interactive
    # Commands to run in interactive sessions can go here
    
end

if type -q tmux
	if status is-interactive
		and not set -q TMUX
		tmux new-session -A -s main
	end
end
