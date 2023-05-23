local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, {
        desc = "Hover actions",
        buffer = bufnr
      })
      vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, {
        desc = "Code action groups",
        buffer = bufnr
      })
      vim.keymap.set("n", "<Leader>rr", "<cmd>:RustRun<cr>", {
        desc = "Run Code",
        buffer = bufnr
      })
    end,
  },
})
