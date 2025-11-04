XDG_CONFIG_HOME ?= $(HOME)/.config

.PHONY: install uninstall

install: $(HOME)/.bashrc $(HOME)/.bash_profile $(HOME)/.bash_logout $(XDG_CONFIG_HOME)/starship.toml

uninstall:
	unlink "$(HOME)/.bash_profile"
	unlink "$(HOME)/.bashrc"
	unlink "$(HOME)/.bash_logout"
	unlink "$(XDG_CONFIG_HOME)/starship.toml"

$(HOME)/.bashrc: .bashrc
	ln --symbolic "$(abspath $<)" "$@"

$(HOME)/.bash_profile: .bash_profile
	ln --symbolic "$(abspath $<)" "$@"

$(HOME)/.bash_logout: .bash_logout
	ln --symbolic "$(abspath $<)" "$@"

$(XDG_CONFIG_HOME)/starship.toml: starship.toml
	ln --symbolic "$(abspath $<)" "$@"
