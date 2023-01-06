#!/bin/sh

ZOXIDE_RESULT=$(zoxide query -l | fzf)

# if empy exit
if [ -z "$ZOXIDE_RESULT" ]; then
    exit 0
fi

# get folder name
FOLDER=$(basename $ZOXIDE_RESULT)

# search for tmux session name
SESSION=$(tmux list-session | grep $FOLDER | awk '{print $1}')
SESSION=${SESSION//:/}

if [ -z "$TMUX" ]; then
    # tmux is not active
    if [ -z "$SESSION"]; then
        cd $ZOXIDE_RESULT
        tmux -u new-session -s $FOLDER
    else
        tmux -u attach -t $FOLDER
    fi
else
    # tmux is active
    if [ -z "$SESSION" ]; then
        cd $ZOXIDE_RESULT
        # create session
        tmux new-session -d -s $FOLDER
        # attach to session
        tmux switch-client -t $FOLDER
    else
        tmux switch-client -t $FOLDER
    fi
fi
