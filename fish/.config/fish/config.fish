bass source /etc/profile
set -g theme_date_format "+%Y-%m-%d %H:%M"

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/var/home/jmeekhof/google-cloud-sdk/path.fish.inc' ]; . '/var/home/jmeekhof/google-cloud-sdk/path.fish.inc'; end

pyenv init - | source
