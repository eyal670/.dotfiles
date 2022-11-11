#!/usr/bin/env bash

#select from a list of all topics
selected=`curl cht.sh/:list | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

# check for sub topics and set matching seperator
if [[ $(curl cht.sh/$selected/:list) = *[!\ ]* ]]; then
    clear
    echo topic: $selected
    seperator=/ 
    read -p "Enter sub topic, a question or leave empty: " query
else
    clear
    echo topic: $selected
    seperator=\~ 
    read -p "Enter inner section or leave empty: " query
fi

# strip the seperator if query is empty
if [ -z "${query}" ];then
    seperator=''
fi
# replace spaces with +
query=`echo $query | tr ' ' '+'`

# check for tmux arg
option="${1}" 
case ${option} in 
   tmux) #if tmux open in new window 
        tmux neww bash -c "curl -s cht.sh/$selected$seperator$query | less -R" 
      ;; 
   *) #else run outside of tmux 
        curl -s cht.sh/$selected$seperator$query | less -R
      ;; 
esac
