set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

if [ -f '/usr/share/fzf/shell/key-bindings.fish' ]; 
	. '/usr/share/fzf/shell/key-bindings.fish';
end

