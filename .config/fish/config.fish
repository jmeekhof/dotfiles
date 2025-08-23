set -g theme_date_format "+%Y-%m-%d %H:%M"

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin


set -x GPG_TTY (tty)

fish_vi_key_bindings
~/.local/bin/mise activate fish | source
