this_file := $(abspath $(lastword $(MAKEFILE_LIST)))
this_dir := $(patsubst %/,%,$(dir $(this_file)))

.PHONY: install uninstall

install: $(HOME)/.bashrc $(HOME)/.bash_profile $(HOME)/.bashrc.d
	@echo >&2 "Successfully installed bash configuration"

uninstall: $(HOME)/.bashrc $(HOME)/.bash_profile $(HOME)/.bashrc.d
	rm $^
	@echo >&2 "Successfully uninstalled bash configuration"

$(HOME)/.bashrc: $(this_dir)/.bashrc
	mkdir --parents $(dir $@) && ln --symbolic "$<" "$@"

$(HOME)/.bash_profile: $(this_dir)/.bash_profile
	mkdir --parents $(dir $@) && ln --symbolic "$<" "$@"

$(HOME)/.bashrc.d: $(this_dir)/.bashrc.d
	mkdir --parents $(dir $@) && ln --symbolic "$<" "$@"
