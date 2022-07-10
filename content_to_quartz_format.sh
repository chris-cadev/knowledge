#!/bin/bash

get_lines_of_text() {
    file=$1
    cat "$file" | sed '/```/,/```/c\\' | sed '/`/,/\`/c\\'
}

get_tags() {
    local file=$1
    # grep -oP '\S+' = separate into words
    # grep -oP '^#\S+' = search for hashtags
    # grep -oP '(?<=#)\S+' = remove # character from hashtag
    # grep -oP '[^#]+' = remove # characters alone
    get_lines_of_text "$file" | grep -oP '\S+' | grep -oP '^#\S+' | grep -oP '(?<=#)\S+' | grep -oP '[^#]+'
}

get_frontmatter() {
    local file=$1
    local extension="${file##*.}"
    local filename=`basename $file .$extension`

    echo '---'
    echo "title: $filename"
    echo "tags:"
    for tag in `get_tags "$file"`; do
        echo "- $tag"
    done
    echo '---'
}

convert_note_to_quartz_format() {
local file=$1
local extension="${file##*.}"
local filename=`basename $file .$extension`
local directory=`dirname $file`


local note_content=`get_frontmatter $file ; echo '' ; cat $file`
cat <<< $note_content > $file
}

root=${1:-'content'}

IFS=$'\n'
for file in $(find $root -type f -name "*.md"); do
    convert_note_to_quartz_format $file
done
unset IFS
