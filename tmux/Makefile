XDG_CONFIG_HOME ?= $(HOME)/.config

.PHONY: install uninstall

install: $(XDG_CONFIG_HOME)/tmux

uninstall:
	unlink "$(XDG_CONFIG_HOME)/tmux"

$(XDG_CONFIG_HOME)/tmux: .
	ln --symbolic "$(abspath $<)" "$@"
