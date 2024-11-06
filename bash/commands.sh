#!/usr/bin/bash

alias p='ncd "$HOME/projects/personal"'
alias w='ncd "$HOME/projects/work"'
alias o='ncd "$HOME/projects/third-party"'

alias rocket-league='legendary launch Sugar -- --language=jpn'

alias venv='source .venv/bin/activate'


# Change into a directory and immediately print its contents.
#
# Arguments:
#   $1: An absolute or relative path to the target directory.
ncd() {
    cd "$@" && ls -l --almost-all
}

# Create a directory and immediately change into it.
#
# Note:
#   This command DOES NOT WORK if you are using curly brace syntax to create
#   multiple directories at once.
#
# Arguments:
#   $1: An absolute or relative path to the target directory to create
#
# Errors:
#   1: A file or directory already exists at the target path
nmkdir() {
    declare target="$1"

    if [ -e "$target" ]; then
        echo >&2 "error: directory (or file with same name) already exists"
        return 1
    fi

    # For mkdir, it is possible to create multiple directories using the '{}'
    # syntax. However, this is not allowed in the `cd` command. Remove anything
    # following the first '{' and cd there instead.
    local cd_target="$(cut -d '{' -f 1 <<< \"$target\")"

    mkdir --parents "$1" && ncd "$cd_target"
}

# Force close the Steam process because the X only minimizes it...
#
# This command does nothing if Steam is not running.
steam-exit() {
    ps -aux \
        | grep -P "$XDG_DATA_HOME/Steam/ubuntu12_32/steam" \
        | grep -v "grep" \
        | head -n 1 \
        | awk '{print $2}' \
        | xargs --no-run-if-empty --replace={} -- kill {}
}
