#!/usr/bin/bash

main() {
    if [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
    fi
}

main "$@"
unset -f main
