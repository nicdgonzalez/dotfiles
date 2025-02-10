JOURNAL_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/journal"

# There is no guarantee the order in which journal-related commands will be
# executed, so we should make sure the directory exists before doing anything
if [ ! -e "$JOURNAL_PATH" ]; then
    mkdir --parents "$JOURNAL_PATH"
fi


get_entry_path_today() {
    echo "$JOURNAL_PATH/$(date -Idate).md"
}

get_tasks_incomplete() {
    ls "$JOURNAL_PATH" \
        | tail -n 1 \
        | xargs --no-run-if-empty --replace={} -- cat "$JOURNAL_PATH/{}" \
        | grep "\- \[ \]"
}

read -r -d "" CONTENT_DEFAULT << EOL
# Entry for $(date -Idate)

## Tasks

$(get_tasks_incomplete)

## Notes

EOL

# Create a new journal entry.
journal-open() {
    local journal_entry_today="$(get_entry_path_today)"

    if [ ! -e "$journal_entry_path" ]; then
        echo -e "$CONTENT_DEFAULT" > "$journal_entry_path"
    fi

    $EDITOR "$journal_entry_path"
}

# Write a timestamped log message in today's journal entry.
journal-write() {
    declare message="$1"

    echo "$(date -Iseconds) $message" >> "$(get_entry_path_today)"
}


journal-read() {
    cat "$(get_entry_path_today)"
}
