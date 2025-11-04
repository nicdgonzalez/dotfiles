XDG_DATA_HOME ?= $(HOME)/.local/share

.PHONY: install uninstall

install: $(XDG_DATA_HOME)/fonts

uninstall:
	unlink "$(XDG_DATA_HOME)/fonts"

$(XDG_DATA_HOME)/fonts: fonts
	ln --symbolic "$(abspath $<)" "$@"
