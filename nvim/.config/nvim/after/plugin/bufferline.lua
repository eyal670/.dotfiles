vim.opt.termguicolors = true

require("bufferline").setup {}

vim.keymap.set("n", "L", ':BufferLineCycleNext<CR>', { desc = 'next tab' })
vim.keymap.set("n", "H", ':BufferLineCyclePrev<CR>', { desc = 'prev tab' })
