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

update_prompt() {
    local previous_exit_status="$?"
    local now="$(date +%R)"
    local user_segment="\[\e[48;2;243;139;168;38;2;17;17;27m\]  \u"
    local directory_segment="\[\e[48;2;250;179;135m\]  \w"
    local git_branch_segment="\[\e[48;2;249;226;175m\]  $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo '-')"
    local time_segment="\e[48;2;166;227;161m\]  $now"
    local exit_status_segment="\[\e[48;2;116;199;236m\] $previous_exit_status"

    export PS1="$user_segment $directory_segment $git_branch_segment $time_segment $exit_status_segment \[\e[0m\]\n\\$ "
}
export PROMPT_COMMAND='update_prompt'
