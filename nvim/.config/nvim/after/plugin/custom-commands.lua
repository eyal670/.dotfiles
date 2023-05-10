vim.cmd('command -nargs=0 Timestamp lua TimeStamp()')

function TimeStamp()
  vim.fn.system('date +%s%3N | xclip -selection clipboard && notify-send "timestamp copy to clipbaord"')
end
