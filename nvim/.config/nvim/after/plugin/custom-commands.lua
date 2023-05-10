vim.api.nvim_create_user_command("TimestampCopy", function()
  vim.fn.system("date +%s%3N | xclip -selection clipboard && notify-send \"timestamp copy to clipbaord\"")
end, {})

vim.api.nvim_create_user_command("TimestampAppend", function()
  local timestamp = string.sub(vim.fn.system("date +%s%3N"), 1, -2)
  vim.api.nvim_command("s:\\%#\\w\\+\\zs:_" .. timestamp .. ":")
end, {})
