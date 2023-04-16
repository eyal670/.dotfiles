vim.keymap.set('n', '<leader>h',vim.cmd.nohlsearch , { desc = 'No Highlight' })

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'No Highlight' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'No Highlight' })

vim.keymap.set("v", "<", "<gv", { desc = 'No Highlight' })
vim.keymap.set("v", ">", ">gv", { desc = 'No Highlight' })


vim.keymap.set("n", "J", "mzJ`z", { desc = 'append next line to current line' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'scroll half page down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'scroll half page up' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'next search result' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'prev search result' })

vim.keymap.set('n', '<leader>c',vim.cmd.close , { desc = 'close window' })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'past without overwrite clipboard' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = 'copy to sys clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'copy CurPos to eol to sys clipboard' })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = 'delete without overwrite clipboard' })

vim.keymap.set('n', '<leader>z',vim.cmd.ZenMode , { desc = 'toggle zen mode' })
