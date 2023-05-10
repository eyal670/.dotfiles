vim.keymap.set('n', '<leader>h', vim.cmd.nohlsearch, { desc = 'No Highlight' })

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'move selected line down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'move selected line up' })

vim.keymap.set("v", "<", "<gv", { desc = 'indent in' })
vim.keymap.set("v", ">", ">gv", { desc = 'indent out' })


vim.keymap.set("n", "J", "mzJ`z", { desc = 'append next line to current line' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'scroll half page down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'scroll half page up' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'next search result' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'prev search result' })

-- vim.keymap.set('n', '<leader>c', vim.cmd.close, { desc = 'close window' })
vim.keymap.set('n', '<leader>c', ':bp | sp | bn | bd<CR>', { desc = 'close buffer' })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'past without overwrite clipboard' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'copy to sys clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'copy CurPos to eol to sys clipboard' })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'delete without overwrite clipboard' })

vim.keymap.set('n', '<leader>z', vim.cmd.ZenMode, { desc = 'toggle zen mode' })

-- copy path to clipboard
vim.keymap.set('n', '<leader>Cc',
  "<cmd>!pwd | tr -d \"\\n\" | xclip -selection clipboard | dunstify \"path copy to clipboard\"<cr>",
  { desc = 'copy project path to clipboard' })
vim.keymap.set('n', '<leader>Cf', "<cmd>:let @+ = expand('%:p') | !dunstify \"full file path copy to clipboard\"<cr>",
  { desc = 'copy file path to clipboard' })

-- escape terminal and go back to prev buffer
-- vim.keymap.set('t', '<C-w>w', "<C-\\><C-N><C-w>w", { desc = 'back to prev buffer' })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
