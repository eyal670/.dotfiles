#!/usr/bin/env bash
selected=`curl cht.sh/:list | fzf`
if [[ -z $selected ]]; then
    exit 0
fi
clear
read -p "Enter Query: " query
read -p "Seperator(~,/)[/]: " seperator
seperator=${seperator:-/}
query=`echo $query | tr ' ' '+'`
tmux neww bash -c "curl -s cht.sh/$selected$seperator$query | less -R"
