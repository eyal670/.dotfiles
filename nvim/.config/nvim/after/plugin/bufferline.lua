vim.opt.termguicolors = true

require("bufferline").setup {}

vim.keymap.set("n", "H", ':BufferLineCycleNext<CR>', { desc = 'next tab' })
vim.keymap.set("n", "L", ':BufferLineCyclePrev<CR>', { desc = 'prev tab' })
