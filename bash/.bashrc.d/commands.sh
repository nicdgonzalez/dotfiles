#!/usr/bin/bash

alias reload='source "$HOME/.bashrc"'

ncd() {
    declare -r desc='Change into a directory and print its contents.

    Arguments:
        $1: An absolute or relative path to the target directory.
    '

    cd "$@" && ls -l --almost-all
}

if [ ! -e "$HOME/projects" ]; then
    mkdir --parents "$HOME/projects/{personal,work,third-party}"
fi

export NDG_PROJECTS="$HOME/projects"
alias p='ncd "$NDG_PROJECTS/personal"'
alias w='ncd "$NDG_PROJECTS/work"'
alias o='ncd "$NDG_PROJECTS/third-party"'

nmkdir() {
    declare -r desc='Create a directory and immediately change into it.

    Warning:
      This command DOES NOT WORK if you are using curly brace syntax to create
      multiple directories at once.

    Arguments:
      $1: An absolute or relative path to the target directory to create.

    Errors:
      1: A file or directory already exists at the target path.
    '

    declare target="$1"

    if [ -e "$target" ]; then
        echo >&2 "error: file already exists"
        return 1
    fi

    # For mkdir, it is possible to create multiple directories using the '{}'
    # syntax. However, this is not allowed in the `cd` command. Remove anything
    # following the first '{' and cd there instead.
    local cd_target="$(cut -d '{' -f 1 <<<"$target")"

    mkdir --parents "$1" && ncd "$cd_target"
}

alias ntree='tree --dirsfirst --noreport -n --gitignore'

create-repo() {
    declare -r desc='Create a new GitHub repository, and set it as the remote
    `origin` in the current project.

    Arguments:
      $1: A name for the new repository.
    '

    declare repo_name="$1"

    git init --initial-branch="main"

    gh repo create --private $repo_name |
        tail -n 1 |
        awk -F '/' '{printf "git@github.com:%s/%s.git", $4, $5}' |
        xargs -I {} git remote add origin {}
}
