this_file := $(abspath $(lastword $(MAKEFILE_LIST)))
this_dir := $(patsubst %/,%,$(dir $(this_file)))

ifeq ($(XDG_DATA_HOME),)
	XDG_DATA_HOME := $(HOME)/.local/share
endif

.PHONY: install uninstall

install: $(XDG_DATA_HOME)/fonts
	@echo >&2 "Successfully installed fonts"

uninstall: $(XDG_DATA_HOME)/fonts
	@echo >&2 "Successfully uninstalled fonts"

$(XDG_DATA_HOME)/fonts: $(this_dir)/assets
	mkdir --parents $(dir $@) && ln --symbolic "$<" "$@"
