# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH"
fi
export PATH

EDITOR=/usr/bin/nvim
VISUAL=/usr/bin/nvim
export EDITOR VISUAL

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export DOCKER_HOST="unix://$(podman info -f "{{.Host.RemoteSocket.Path}}")"
export PYENV_ROOT="$HOME/.pyenv"
export OPENWEATHERAPI=6ba1e19e19e925eb259418c07d7f8a48
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
. "$HOME/.cargo/env"
