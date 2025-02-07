#!/usr/bin/bash

set -eo pipefail
[[ ! -z "${TRACE+x}" ]] && set -x

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

OUT_PATH="$HOME/.local/bin/vesktop"
ICON_PATH="$XDG_DATA_HOME/vesktop/vesktop.png"

DESKTOP_FILE="\
[Desktop Entry]
Name=Vesktop
Exec=$HOME/.local/bin/vesktop
Type=Application
Icon=${ICON_PATH}

Comment=A custom configuration for Vesktop.
"

main() {
    # Download the latest AppImage for Vesktop.
    mkdir --parents "$(dirname "$OUT_PATH")" \
        && curl --show-error --location --output "$OUT_PATH" -- https://vencord.dev/download/vesktop/amd64/appimage

    # Create a Desktop application so we don't have to launch from the command line.
    echo "$DESKTOP_FILE" \
        | sudo tee "${XDG_DATA_HOME}/applications/vesktop.desktop" > /dev/null

    mkdir --parents "$(dirname "$ICON_PATH")" \
        && curl -SsLo "$ICON_PATH" -- https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fdl.flathub.org%2Frepo%2Fappstream%2Fx86_64%2Ficons%2F128x128%2Fdev.vencord.Vesktop.png&f=1&nofb=1&ipt=1c2fe52137680a57ff080a085d528a93ba2a03fa0ee36a1cf00a24aed17c4488&ipo=images

    # Refresh the Desktop icons
    sudo update-desktop-database
}

main "$@"

unset -f main
unset DESKTOP_FILE
unset ICON_PATH
unset OUT_PATH
