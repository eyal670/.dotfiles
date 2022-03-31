alias cpwd="pwd | xclip -selection clipboard"
alias fcd='cd (find $HOME/DevLab/ -type d | fzf)'
alias fcd='cd (find $HOME/Docker/ $HOME/DevLab/ -type d 2>&1 | grep -v "Permission denied" | fzf)'
