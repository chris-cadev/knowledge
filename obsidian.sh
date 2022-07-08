get_wikilinks() {
    local file=$1
    cat "$file" | grep -oP "\[\[[^\]]+\]\]"
}

get_link_names() {
    local file=$1
    cat "$file" | grep -oP "(?<=\[\[)[^\]]+" | cut -f1 -d"|"
}

get_links_from_directory() {
    local directory=$1
    IFS=$'\n'
    for content_note in $(find "$directory" -type f -name "*.md"); do
        get_link_names $content_note
    done
    unset IFS
}

get_links_not_in_directory() {
    local directory=$1
    IFS=$'\n'
    for link_name in $(get_links_from_directory $directory); do
        if [[ ! -z `find "$directory" -type f -name "*$link_name.md"` ]]; then
            continue
        fi
        echo $link_name
    done
    unset IFS
}
