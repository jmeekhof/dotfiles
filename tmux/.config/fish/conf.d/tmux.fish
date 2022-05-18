# Credit for this gem: https://www.markhansen.co.nz/auto-start-tmux/
if type -q tmux
	if status is-interactive 
		and not set -q TMUX
		tmux-start.sh #tmux new-session -A -s main
	end
end

