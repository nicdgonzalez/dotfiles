#!/usr/bin/bash

alias p='ncd "$HOME/projects/personal"'
alias w='ncd "$HOME/projects/work"'
alias o='ncd "$HOME/projects/third-party"'


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

    mkdir --parents "$1" && ncd "$1"
}
