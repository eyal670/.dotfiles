alias cpwd="pwd | xclip -selection clipboard"
alias tmux="tmux -u"
alias lspt="sh ~/Scripts/launchspt.sh"
alias song_notify="sh ~/Scripts/songnotification.sh"
alias wttr="curl wttr.in/Atlit"
alias fcd='cd $(find $HOME/Docker/ $HOME/DevLab/ -type d 2>&1 | grep -v "Permission denied" | fzf)'
