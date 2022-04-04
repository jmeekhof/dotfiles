# Credit for this gem: https://www.markhansen.co.nz/auto-start-tmux/
if status is-interactive
	and not set -q TMUX
	tmux new-session -A -s main
end

