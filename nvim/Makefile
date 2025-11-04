XDG_CONFIG_HOME ?= $(HOME)/.config

.PHONY: install uninstall

install: $(XDG_CONFIG_HOME)/nvim

uninstall:
	unlink "$(XDG_CONFIG_HOME)/nvim"

$(XDG_CONFIG_HOME)/nvim: .
	ln --symbolic "$(abspath $<)" "$@"
