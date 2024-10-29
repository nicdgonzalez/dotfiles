#!/usr/bin/bash

set -eo pipefail
[[ ! -z "${TRACE+x}" ]] && set -x

# https://specifications.freedesktop.org/basedir-spec/latest/#variables
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

DESKTOP_FILE="\
[Desktop Entry]
Name=Minecraft Launcher
Exec=${HOME}/.local/bin/minecraft-launcher
Type=Application
Icon=${XDG_DATA_HOME}/minecraft-launcher/Minecraft_Launcher.svg

Comment=A custom configuration for the Minecraft Launcher
"

MINECRAFT_LAUNCHER_ICON="https://static.wikia.nocookie.net/logopedia/images/e/e3/Minecraft_Launcher.svg/revision/latest?cb=20230616222246"

main() {
    if ! command -v inkscape > /dev/null; then
        echo >&2 "error: expected command 'inkscape' to be available"
    fi

    curl -SsL https://launcher.mojang.com/download/Minecraft.tar.gz \
        --output /tmp/Minecraft.tar.gz

    tar -xvf "/tmp/Minecraft.tar.gz" -C "$XDG_DATA_HOME/"
    rm "/tmp/Minecraft.tar.gz"

    if [ ! -e "$HOME/.local/bin" ]; then
        # This directory is partially architecture-specific, so it is not
        # always created by default. Even so, it should still exist in our
        # PATH variable, so we will link our launcher here instead of /usr/bin
        mkdir --parents "$HOME/.local/bin"
    fi

    ln --symbolic --force "$XDG_DATA_HOME/minecraft-launcher/minecraft-launcher" "$HOME/.local/bin/minecraft-launcher"

    curl -SsL "$MINECRAFT_LAUNCHER_ICON" > /tmp/Minecraft_Launcher.svg

    # Convert the SVG into a 128x128 PNG to use for the application icon
    inkscape \
	    --export-type="png" \
	    --export-area-page \
	    --export-width=128 \
	    --export-height=128 \
	    --export-filename="$XDG_DATA_HOME/minecraft-launcher/Minecraft_Launcher.png" \
	    /tmp/Minecraft_Launcher.svg

    rm /tmp/Minecraft_Launcher.svg

    # Create a Desktop application so we don't have to launch from command line
    echo "$DESKTOP_FILE" | sudo tee "${XDG_DATA_HOME}/applications/minecraft-launcher.desktop" > /dev/null

    # Refresh the Desktop icons
    sudo update-desktop-database
}

main "$@"

unset DESKTOP_FILE
unset MINECRAFT_LAUNCHER_ICON
