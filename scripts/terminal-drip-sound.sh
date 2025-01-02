#!/usr/bin/bash

set -eo pipefail
[[ ! -z "${TRACE+x}" ]] && set -x

DRIP_OGG_URL="https://gitlab.gnome.org/GNOME/gnome-control-center/-/blob/0dd386f405f49105880041202eeb270959ec3268/panels/sound/data/sounds/drip.ogg"

main() {
    local drip_filepath="/tmp/drip.ogg"
    local target_filename="$(cd /usr/share/sounds/gnome/default/alerts && ls | awk '/.*.ogg/ {print $1}' | head -n 1)"
    local target="/usr/share/sounds/gnome/default/alerts/$target_filename"

    curl --show-error --silent --location "$DRIP_OGG_URL" --output - \
        | tee "$drip_filepath" > /dev/null

    sudo mv "$target" "$target.backup"

    sudo mv "$drip_filepath" "$target"
}

main "$@"
