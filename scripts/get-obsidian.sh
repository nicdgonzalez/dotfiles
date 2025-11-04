#!/usr/bin/bash

set -eo pipefail
[[ ! -z "${TRACE+x}" ]] && set -x

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

THIS_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
ICON_PATH="${THIS_DIR}/assets/obsidian-icon.png"

DESKTOP_FILE="\
[Desktop Entry]
Name=Obsidian
Exec=${HOME}/.local/bin/obsidian
Type=Application
Icon=$ICON_PATH
"

main() {
    # Download the latest release of Obsidian.
    local appimage_url="$( \
        curl --silent --show-error https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest \
        | grep "browser_download_url.*AppImage" \
        | grep --invert-match "arm64" \
        | cut --delimiter='"' --fields=4 \
    )"
    curl \
        --silent \
        --show-error \
        --location \
        --output "$HOME/.local/bin/obsidian" \
        -- \
        "$appimage_url"
    chmod u+x "$HOME/.local/bin/obsidian"

    mkdir --parents "$(dirname "$ICON_PATH")" \
        && ln --symbolic --force "$PWD/$(basename "$ICON_PATH")" "$ICON_PATH"

    # Create a desktop shortcut so we don't have to launch from the command line.
    echo "$DESKTOP_FILE" | sudo tee "${XDG_DATA_HOME}/applications/obsidian.desktop" > /dev/null

    sudo update-desktop-database
}

main "$@"
