function vim --wraps=nvim --description 'alias vim=nvim'
	if not test \( -e "/run/.containerenv" -o -e "/run/.toolboxenv" \)
		nvim $argv
	end
	if test \( -f /run/.containerenv -a -f /run/.toolboxenv \)
		flatpak-spawn --host nvim $argv 
	end
end
