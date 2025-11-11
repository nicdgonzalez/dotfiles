#!/bin/bash

# System-wide definitions
if [ -r "/etc/bashrc" ]; then
    source "/etc/bashrc"
fi

# User-specific environment
if ! [[ ":$PATH:" =~ ":$local_bin:" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Split the configuration into multiple files
if [ -r "$HOME/.bashrc.d" ]; then
    for rc in "$HOME/.bashrc.d/*.sh"; do
        if ! [ -d "$rc" ]; then
            source "$rc"
        fi
    done
    unset rc
fi

# Rust
[ -r "$HOME/.cargo" ] && source "$HOME/.cargo/env"

# Go
[ -r "$HOME/go" ] && export PATH="$HOME/go/bin:$PATH"

# pnpm (JavaScript)
export PNPM_HOME="/home/ngonzalez/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Gradle (Java)
export PATH="$PATH:/opt/gradle/gradle-9.1.0/bin"

# Orbit (tmux session manager)
get_orbit_path() {
    local -r projects_dir="$HOME/projects"

    local -r personal="$projects_dir/personal"
    # Each client has a subdirectory with projects inside.
    local -r work="$(
        find "$projects_dir/work" \
            -mindepth 1 \
            -maxdepth 1 \
            -type d \
            -printf "%p:" |
            sed 's/:$//' # Remove the trailing colon
    )"

    echo "$personal:$work"
}
export ORBIT_PATH="$(get_orbit_path)"
unset -f get_orbit_path

eval "$(starship init bash)"

export EDITOR="$(command -v nvim)"

alias ntree='tree --dirsfirst --noreport -n --gitignore'
alias venv='source .venv/bin/activate'
