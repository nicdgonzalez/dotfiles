#!/usr/bin/bash

# TODO: Create a separate repository for this if I can make it generic enough
# that others may benefit from it. Similar to `knight`.

set -eo pipefail
[ ! -z "${TRACE+x}" ] && set -x

main() {
    local themes="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/themes"

    while true; do
        local system_theme="$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")"
        local linked_theme="$(readlink "$themes/current.conf")"

        if [ ! -e "$themes/light.conf" ]; then
            echo >&2 "error: missing required file: $themes/light.conf"
            exit 1
        fi

        if [ ! -e "$themes/dark.conf" ]; then
            echo >&2 "error: missing required file: $themes/dark.conf"
            exit 1
        fi

        case "$system_theme" in
            "default")
                if [ "$(basename "$linked_theme")" != "light.conf" ]; then
                    ln --symbolic --force "$themes/light.conf" "$themes/current.conf"
                    tmux source-file "$themes/current.conf"
                fi
                ;;
            "prefer-dark")
                if [ "$(basename "$linked_theme")" != "dark.conf" ]; then
                    ln --symbolic --force "$themes/dark.conf" "$themes/current.conf"
                    tmux source-file "$themes/current.conf"
                fi
                ;;
            *)
                echo >&2 "error: unrecognized color scheme '$system_theme'"
                exit 1
                ;;
        esac

        sleep 1
    done
}

main "$@"
