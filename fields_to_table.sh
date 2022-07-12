#!/bin/bash

get_fields() {
    local file=$1
    cat "$file" | grep -oP ".+::.+"
}

fields_to_table() {
    local file=$1
    echo ""
    echo "<table>"
    for field in `get_fields "$file"`; do
        local key="`echo $field | awk -F '::' '{print $1}' | xargs`"
        local value="`echo $field | awk -F '::' '{print $2}' | xargs`"
        echo "<tr>"
        echo "<td> ${key##*( )} </td>"
        echo "<td> ${value##*( )} </td>"
        echo "</tr>"
    done
    echo "</table>"
    echo ""
}

remove_fields_from_file() {
    local file=$1
    local new_file_content=`cat "$file" | sed '/::/d'`
    cat <<< $new_file_content > "$file"
}

root=${1:-"content"}

IFS=$'\n'
for file in `find $root -type f -name "*.md"`; do
    if [[ `get_fields "$file" | wc -l` -lt "1" ]]; then
        continue
    fi
    new_file_content=`fields_to_table $file ; cat "$file"`
    cat <<< $new_file_content > "$file"
    remove_fields_from_file "$file"
done
unset IFS