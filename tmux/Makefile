this_file := $(abspath $(lastword $(MAKEFILE_LIST)))
this_dir := $(patsubst %/,%,$(dir $(this_file)))

ifeq ($(XDG_CONFIG_HOME),)
	XDG_CONFIG_HOME := $(HOME)/.config
endif

.PHONY: install uninstall

install: $(XDG_CONFIG_HOME)/tmux $(XDG_CONFIG_HOME)/systemd/user/tmux-theme-switcher.service
	@echo >&2 "Successfully installed tmux configuration"

uninstall:
	rm $(XDG_CONFIG_HOME)/tmux
	@echo >&2 "Successfully uninstalled tmux configuration"

$(XDG_CONFIG_HOME)/tmux: $(this_dir)
	mkdir --parents $(dir $@)
	ln --symbolic "$<" "$@"


$(XDG_CONFIG_HOME)/systemd/user/tmux-theme-switcher.service: $(this_dir)/tmux-theme-switcher.service
	mkdir --parents $(dir $@)
	ln --symbolic "$<" "$@"
	systemctl --user daemon-reload
	systemctl --user start tmux-theme-switcher.service
	systemctl --user enable tmux-theme-switcher.service
