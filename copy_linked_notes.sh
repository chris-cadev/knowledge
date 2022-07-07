#!/bin/bash

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

root=${1:-'content'}
resources=${2:-'files'}

IFS=$'\n'
for link_name in `get_links_not_in_directory $root | sort | uniq`; do
    for file in `find $resources -type f -name "*$link_name.md"`; do
        target_directory=`dirname $file | sed "s/$resources\///"`
        file_name=`basename $file`
        target_file="$root/$target_directory/$file_name"
        copy_command="cp \"$file\" \"$target_file\""
        directory_command="mkdir -p `dirname $target_file`"
        eval $directory_command
        eval $copy_command
    done
done
unset IFS
