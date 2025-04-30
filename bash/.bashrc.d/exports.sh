#!/usr/bin/bash

# https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export EDITOR='/usr/bin/nvim'

get_orbit_paths() {
    # NDG_PROJECTS is defined in `commands.sh`.
    local personal="$NDG_PROJECTS/personal"

    # Each client has their own subdirectory with projects inside.
    local work="$(find "$NDG_PROJECTS/work" -mindepth 1 -maxdepth 1 -type d -printf "%p:" | sed 's/:$//')"

    local minecraft="$NDG_PROJECTS/minecraft"

    echo "$personal:$work:$minecraft"
}
export ORBIT_PATH="$(get_orbit_paths)"
unset -f get_orbit_paths
