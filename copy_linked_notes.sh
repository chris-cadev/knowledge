#!/bin/bash

source "$(dirname "$0")/obsidian.sh"

get_no_copied_files() {
    local root="$1"
    local resources="$2"
    IFS=$'\n'
    for link_name in `get_links_not_in_directory $root | sort | uniq`; do
        for file in `find $resources -type f -name "*$link_name.md"`; do
            local file_in_root=`echo "$root/$(echo $file | sed "s/$resources\///")"`
            if [[ ! -f $file_in_root ]]; then
                echo "$file;$file_in_root"
            fi
        done
    done
    unset IFS
}


root=${1:-'content'}
resources=${2:-'files'}
files_left_to_copy=`get_no_copied_files "$root" "$resources" | wc -l`

IFS=$'\n'
while [ $files_left_to_copy != "0" ];
do
    for resource_root in `get_no_copied_files "$root" "$resources" | grep -v "Zettelkasten"`; do
        resource_file_path=`echo $resource_root | cut -d';' -f1`
        root_file_path=`echo $resource_root | cut -d';' -f2`
        target_directory="`dirname "$root_file_path"`"
        mkdir -p "$target_directory"
        cp "$resource_file_path" "$root_file_path"
    done
    files_left_to_copy=`get_no_copied_files "$root" "$resources" | grep -v "Zettelkasten" | wc -l`
done
unset IFS
