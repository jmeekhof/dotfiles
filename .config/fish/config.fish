set -g theme_date_format "+%Y-%m-%d %H:%M"

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin


set -x GPG_TTY (tty)

pyenv init - | source

eval (/opt/homebrew/bin/brew shellenv)

source /opt/homebrew/opt/asdf/libexec/asdf.fish
