#!/usr/bin/bash

set -eo pipefail
[ ! -z "${TRACE+x}" ] && set -x

THIS_DIR="$(dirname "${BASH_SOURCE[0]}")"

EXEC_PATH="$HOME/.local/bin/legcord"
ICON_PATH="$THIS_DIR/assets/legcord-desktop.png"

DESKTOP_TEXT="\
[Desktop Entry]
Name=Legcord
Exec=$EXEC_PATH
Type=Application
Icon=$ICON_PATH
"
DESKTOP_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/applications/legcord.desktop"

main() {
    echo -n >&2 "Getting latest version of Legcord..."
    local download_url="$( \
        curl --silent --show-error "https://api.github.com/repos/Legcord/Legcord/releases/latest" | \
        grep --perl-regexp "(browser_download_url.*)Legcord-(.*)-linux-x86_64.AppImage" 2> /dev/null | \
        cut --delimiter='"' --fields=4 \
    )"

    if [ -z "$download_url" ]; then
        echo >&2 ""
        echo >&2 "error: failed to get download url"
        exit 1
    fi

    mkdir --parents "$(dirname "$EXEC_PATH")" \
        && curl --silent --show-error --location --output "$EXEC_PATH" -- "$download_url"
    echo >&2 "Done!"

    echo -n >&2 "Creating desktop icon..."
    echo "$DESKTOP_TEXT" > "$DESKTOP_PATH"
    echo >&2 "Done!"

    echo >&2 "Updating desktop database..."
    sudo update-desktop-database
    echo >&2 "Done!"
}

main "$@"
