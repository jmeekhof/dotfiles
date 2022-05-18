bass source /etc/profile
set -g theme_date_format "+%Y-%m-%d %H:%M"

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin

# set -g fish_user_paths "/usr/local/opt/openjdk@11/bin" $fish_user_paths
#status --is-interactive; and pyenv init - | source
#status --is-interactive; and pyenv virtualenv-init - | source



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/var/home/jmeekhof/google-cloud-sdk/path.fish.inc' ]; . '/var/home/jmeekhof/google-cloud-sdk/path.fish.inc'; end

	#bass source "$HOME/.config/fish/conda.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/jmeekhof/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /var/home/jmeekhof/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Credit for this gem: https://www.markhansen.co.nz/auto-start-tmux/
#if status is-interactive
#	and not set -q TMUX
#	tmux new-session -A -s main
#end
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/home/jmeekhof/.local/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/home/jmeekhof/micromamba"
eval "/home/jmeekhof/.local/bin/micromamba" shell hook --shell fish --prefix "/home/jmeekhof/micromamba" | source
# <<< mamba initialize <<<
