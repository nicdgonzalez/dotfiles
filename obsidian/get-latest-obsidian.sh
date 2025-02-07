#!/usr/bin/bash

set -eo pipefail
[[ ! -z "${TRACE+x}" ]] && set -x

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

ICON_PATH="${XDG_DATA_HOME}/obsidian/obsidian-icon.svg"

DESKTOP_FILE="\
[Desktop Entry]
Name=Obsidian
Exec=${HOME}/.local/bin/obsidian
Type=Application
Icon=$ICON_PATH

Comment=A custom desktop shortcut for Obsidian.
"

main() {
    # Download the latest release of Obsidian.
    local APPIMAGE_URL="$( \
        curl --silent --show-error https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest \
        | grep "browser_download_url.*AppImage" \
        | grep --invert-match "arm64" \
        | cut --delimiter='"' --fields=4 \
    )"
    curl --silent --show-error --location --output "$HOME/.local/bin/obsidian" -- "$APPIMAGE_URL"
    chmod u+x "$HOME/.local/bin/obsidian"

    mkdir --parents "$(dirname "$ICON_PATH")" && ln --symbolic --force "$PWD/$(basename "$ICON_PATH")" "$ICON_PATH"

    # Create a desktop shortcut so we don't have to launch from the command line.
    echo "$DESKTOP_FILE" | sudo tee "${XDG_DATA_HOME}/applications/obsidian.desktop" > /dev/null

    sudo update-desktop-database
}

main "$@"

unset -f main
