#!/bin/bash

source "$(dirname "$0")/obsidian.sh"

root=${1:-'content'}
resources=${2:-'files'}

IFS=$'\n'
for link_name in `get_links_not_in_directory $root | sort | uniq`; do
    for file in `find $resources -type f -name "*$link_name.md"`; do
        target_directory=`dirname $file | sed "s/$resources\///"`
        # TODO: extract this statement to a function
        if [[ "$target_directory" == *"Zettelkasten"* ]]; then
            continue
        fi
        file_name=`basename $file`
        target_file="$root/$target_directory/$file_name"
        mkdir -p "`dirname $target_file`"
        cp "$file" "$target_file"
    done
done
unset IFS
