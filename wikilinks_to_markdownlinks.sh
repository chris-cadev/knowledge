#!/bin/bash

source "$(dirname "$0")/obsidian.sh"

replace_wikilink_with_markdownlink() {
    local wikilink=$1
    local root=$2
    local file=$3

    local file_content=`cat "$file"`
    local link_text=$(echo "$wikilink" | sed 's/\[//g'| sed 's/\]//g')
    local filename=$(echo "$link_text" | cut -d"|" -f1)
    local placeholder=$(echo "$wikilink" | cut -d"|" -f2)
    if [[ ! -z $placeholder ]]; then
        placeholder="$filename"
    fi

    local link_filepath=`find "$root" -type f -name "*$filename.*"`
    if [[ -z `echo "$link_filepath"` ]]; then
        return
    fi    
    local files_found_count=`cat <<< $link_filepath | wc -l`
    if [[ $files_found_count != "1" ]]; then
        # to many files case
        return
    fi
    
    local file_absolute_path=`echo "${link_filepath/"$root"/""}" | sed 's/ /%20/g'`
    local markdownlink="[$placeholder]($file_absolute_path)"
    echo "${file_content/"$wikilink"/"$markdownlink"}" > "$file"
}

# replace_wikilink_with_markdownlink "$1" "$2" "$3"

root=${1:-'content'}

IFS=$'\n'
for file in `find $root -type f -name "*.md"`; do
    for wikilink in `get_wikilinks $file`; do
        replace_wikilink_with_markdownlink "$wikilink" "$root" "$file"
    done
done
unset IFS
