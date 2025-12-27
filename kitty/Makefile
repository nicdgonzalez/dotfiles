XDG_CONFIG_HOME ?= $(HOME)/.config

.PHONY: install uninstall

install: $(XDG_CONFIG_HOME)/kitty

uninstall:
	rm --recursive "$(XDG_CONFIG_HOME)/kitty"

$(XDG_CONFIG_HOME)/kitty: .
	ln --symbolic "$(abspath $<)" "$@"
