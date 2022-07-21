#!/bin/bash

current_directory=$(dirname $0)
sync_folder=${1:-'files/Zettelkasten'}
output=${2:-'content'}

get_ignored_files() {
    IFS=$'\n'
    for item in `cat "$current_directory/config.toml" | grep "ignoreFiles" | cut -d"=" -f2 | grep -oP "(?<=\")[^\"]+"`; do
        if [[ "$item" != *","* && "$item" != *"]"* ]]; then
            echo "$item"
        fi
    done
    unset IFS
}

remove_ignored_files() {
    IFS=$'\n'
    for ignored_file in `get_ignored_files`; do
        local directory=$(dirname "$current_directory$ignored_file")
        if [[ -d $directory ]]; then
            rm -rf "$directory"
            continue
        fi
        # TODO: add feature to support single files and not only directories
        # local file="$ignored_file"
        # if [[ -f $file ]]; then
        #     echo "rm \"$file\""
        # fi
    done
    unset IFS
}

rsync -r -progress "$sync_folder/*" content
remove_ignored_files
