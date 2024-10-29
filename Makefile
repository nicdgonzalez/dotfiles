#!/usr/bin/make

# https://specifications.freedesktop.org/basedir-spec/latest/#variables
XDG_CONFIG_HOME := $${XDG_CONFIG_HOME:-$$HOME/.config}
XDG_DATA_HOME := $${XDG_DATA_HOME:-$$HOME/.local/share}


NVIM_SRC := $(PWD)/nvim
NVIM_DST := $(XDG_CONFIG_HOME)/nvim

TMUX_SRC := $(PWD)/tmux
TMUX_DST := $(XDG_CONFIG_HOME)/tmux

BASH_SRC := $(PWD)/.bashrc.d
BASH_DST := $(HOME)/.bashrc.d

FONTS_SRC := $(PWD)/fonts
FONTS_DST := $(XDG_DATA_HOME)/fonts


.PHONY: help install \
	nvim nvim-uninstall \
	tmux tmux-uninstall \
	bash bash-uninstall \
	fonts fonts-uninstall

help:
	@awk -F: '/^[a-zA-Z0-9._-]+:/ && !/\.PHONY/ {printf "%s, ", $$1}' Makefile | sed 's/, $$/\n/'

install: nvim tmux bash fonts

nvim: $(NVIM_SRC)
	@echo "==> Installing Neovim configuration"
	@ln --symbolic --force "$(NVIM_SRC)" "$(NVIM_DST)"
	@echo "Neovim configuration installed ($(NVIM_DST))"

nvim-uninstall:
	@echo "==> Removing Neovim configuration"
	@if [ ! -e "$(NVIM_DST)" ]; then \
		echo >&2 "error: expected Neovim configuration to be installed"; \
		exit 1; \
	fi
	@unlink "$(NVIM_DST)" || rm --recursive "$(NVIM_DST)"

tmux: $(TMUX_SRC)
	@echo "==> Installing tmux configuration"
	@ln --symbolic --force "$(TMUX_SRC)" "$(TMUX_DST)"
	@echo "tmux configuration installed ($(TMUX_DST))"

tmux-uninstall:
	@echo "==> Removing tmux configuration"
	@if [ ! -e "$(TMUX_DST)" ]; then \
		echo >&2 "error: expected tmux configuration to be installed"; \
		exit 1; \
	fi
	@unlink "$(TMUX_DST)" || rm --recursive "$(TMUX_DST)"

bash: $(BASH_SRC)
	@echo "==> Installing bash configuration"
	@ln --symbolic --force "$(BASH_SRC)" "$(BASH_DST)"
	@echo "bash configuration installed ($(BASH_DST))"

bash-uninstall:
	@echo "==> Removing bash configuration"
	@if [ ! -e "$(BASH_DST)" ]; then \
		echo >&2 "error: expected bash configuration to be installed"; \
		exit 1; \
	fi
	@unlink "$(BASH_DST)" || rm --recursive "$(BASH_DST)"

fonts: $(FONTS_SRC)
	@echo "==> Installing fonts"
	@for font in $(PWD)/fonts/*.ttf; do \
		ln --symbolic --force "$$font" "$(FONTS_DST)/"; \
	done
	@fc-cache --force --verbose

fonts-uninstall:
	@echo "==> Removing added fonts"
	@for font in $(PWD)/fonts/*.ttf; do \
		unlink "$(FONTS_DST)/$$font" || rm "$(FONTS_DST)/$$font"; \
	done
	@fc-cache --force --verbose
