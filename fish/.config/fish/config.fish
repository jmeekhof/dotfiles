set -g theme_date_format "+%Y-%m-%d %H:%M"

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin

# set -g fish_user_paths "/usr/local/opt/openjdk@11/bin" $fish_user_paths
#status --is-interactive; and pyenv init - | source
#status --is-interactive; and pyenv virtualenv-init - | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ];
	. "$HOME/google-cloud-sdk/path.fish.inc"; 
end



