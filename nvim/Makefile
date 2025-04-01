this_file := $(abspath $(lastword $(MAKEFILE_LIST)))
this_dir := $(patsubst %/,%,$(dir $(this_file)))

ifeq ($(XDG_CONFIG_HOME),)
	XDG_CONFIG_HOME := $(HOME)/.config
endif

.PHONY: install uninstall

install: $(XDG_CONFIG_HOME)/nvim
	@echo >&2 "Successfully installed Neovim configuration"

uninstall: $(XDG_CONFIG_HOME)/nvim
	rm $^
	@echo >&2 "Successfully uninstalled Neovim configuration"

$(XDG_CONFIG_HOME)/nvim: $(this_dir)
	mkdir --parents $(dir $@) && ln --symbolic "$<" "$@"
