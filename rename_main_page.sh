#!/bin/bash

# got from here: https://stackoverflow.com/questions/5014632/how-can-i-parse-a-yaml-file-from-a-linux-shell-script
parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

get_main_page_name() {
    parse_yaml data/config.yaml | grep -E "^mainPage" | cut -d'=' -f2
}

rename_main_page() {
    local root=$1
    local main_page_name=`get_main_page_name | sed "s/\"//g"`
    local main_file="$root/$main_page_name.md"

    if [[ ! -f "$main_file" ]]; then
        echo "$main_file does not exist"
        exit 1
    fi

    local move_command="mv \"$main_file\" \"$root/index.md\""
    eval $move_command
}

root=${1:-'content'}

rename_main_page $root


