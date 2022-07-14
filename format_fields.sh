#!/bin/bash

value_to_link() {
    local value=$1
    local url_regex='(https?|ftp|file)://[-[:alnum:]\+&@#/%?=~_|!:,.;]*[-[:alnum:]\+&@#/%=~_|]'
    if [[ $value =~ $url_regex ]]; then
        echo "<a href=\"$value\">$value</a>"
    else
        echo $value
    fi
    
}

get_fields() {
    local file=$1
    cat "$file" | grep -oP ".+::.+"
}

format_fields() {
    local file=$1
    echo "## References"
    echo ""
    for field in `get_fields "$file"`; do
        local key="`echo $field | awk -F '::' '{print $1}' | xargs`"
        local value="`echo $field | awk -F '::' '{print $2}' | xargs`"
        if [[ $key == 'status' || $key == 'type' ]]; then
            continue
        fi
        echo "### ${key##*( )}"
        echo "> $value"
    done
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
    new_file_content=`format_fields $file`
    cat <<< $new_file_content >> "$file"
    remove_fields_from_file "$file"
done
unset IFS