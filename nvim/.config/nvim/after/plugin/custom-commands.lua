-- copy timestamp to clipboard
vim.api.nvim_create_user_command("TimestampCopy", function()
  local timestamp = os.time(os.date("*t"))
  vim.fn.system("echo " .. timestamp .. " | xclip -selection clipboard && notify-send \"timestamp copy to clipbaord\"")
end, {})

-- append timestamp to current word under cursor
vim.api.nvim_create_user_command("TimestampAppend", function()
  local timestamp = os.time(os.date("*t"))
  vim.api.nvim_command("s:\\%#\\w\\+\\zs:_" .. timestamp .. ":")
end, {})
