this_file := $(abspath $(lastword $(MAKEFILE_LIST)))
this_dir := $(patsubst %/,%,$(dir $(this_file)))

ifeq ($(XDG_CONFIG_HOME),)
	XDG_CONFIG_HOME := $(HOME)/.config
endif

.PHONY: install uninstall

install: $(XDG_CONFIG_HOME)/tmux
	@echo >&2 "Successfully installed tmux configuration"

uninstall:
	rm $(XDG_CONFIG_HOME)/tmux
	@echo >&2 "Successfully uninstalled tmux configuration"

$(XDG_CONFIG_HOME)/tmux: $(this_dir)
	mkdir --parents $(dir $@) && ln --symbolic "$<" "$@"
