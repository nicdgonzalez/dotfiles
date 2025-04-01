#!/usr/bin/bash

main() {
    # Source system-wide global definitions.
    if [ -f "/etc/bashrc" ]; then
        source "/etc/bashrc"
    fi

    # User-specific environment.
    local -r local_bin="$HOME/.local/bin"

    if ! [[ ":$PATH:" =~ ":$local_bin:" ]]; then
        PATH="$local_bin:$PATH"
    fi
    export PATH

    # The following allows us to split our configuration into multiple files.
    if [ -d "$HOME/.bashrc.d" ]; then
        for rc in "$HOME"/.bashrc.d/*.sh; do
            if [ -f "$rc" ]; then
                source "$rc"
            fi
        done
        unset rc
    else
        echo >&2 "expected '$HOME/.bashrc.d' to be a directory"
        exit 1
    fi

    # Rust
    [ -d "$HOME/.cargo" ] && source "$HOME/.cargo/env"

    # Golang
    [ -d "$HOME/go" ] && export PATH="$HOME/go/bin:$PATH"
}

main "$@"
unset -f main
