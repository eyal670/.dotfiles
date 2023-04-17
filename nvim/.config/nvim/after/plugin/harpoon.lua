local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>A", mark.add_file, { desc = 'add to harpoon' })
vim.keymap.set("n", "<leader>a", ui.toggle_quick_menu, { desc = 'open harpoon' })

vim.keymap.set("n", "<C-h>", function() ui.nav_next() end, { desc = 'harpoon next' })
vim.keymap.set("n", "<C-l>", function() ui.nav_prev() end, { desc = 'harpoon prev' })
