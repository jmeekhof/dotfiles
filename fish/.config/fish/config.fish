bass source /etc/profile
set -g theme_date_format "+%Y-%m-%d %H:%M"

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin


# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/var/home/jmeekhof/google-cloud-sdk/path.fish.inc' ]; . '/var/home/jmeekhof/google-cloud-sdk/path.fish.inc'; end
source (pack completion --shell fish)

pyenv init - | source
# status --is-interactive; and pyenv virtualenv-init - | source
status --is-interactive; and source (pyenv virtualenv-init -|psub)
source ~/.asdf/asdf.fish

set -x GPG_TTY (tty)
rvm default

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/private/var/joshua/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# pnpm
set -gx PNPM_HOME "/private/var/joshua/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
