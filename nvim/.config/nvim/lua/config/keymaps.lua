-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- copy path to clipboard
vim.keymap.set(
  "n",
  "<leader>bc",
  '<cmd>!pwd | tr -d "\\n" | xclip -selection clipboard | dunstify "path copy to clipboard"<cr>',
  { desc = "copy project path to clipboard" }
)
vim.keymap.set(
  "n",
  "<leader>bf",
  "<cmd>:let @+ = expand('%:p') | !dunstify \"full file path copy to clipboard\"<cr>",
  { desc = "copy file path to clipboard" }
)

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected line up" })

vim.keymap.set("v", "<", "<gv", { desc = "indent in" })
vim.keymap.set("v", ">", ">gv", { desc = "indent out" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "append next line to current line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll half page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "prev search result" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "past without overwrite clipboard" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy to sys clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "copy CurPos to eol to sys clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete without overwrite clipboard" })
