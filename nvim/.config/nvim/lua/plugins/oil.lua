return {
  "stevearc/oil.nvim",
  keys = {
    vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" }),
  },
  opts = {
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, ".")
      end,
      -- This function defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr)
        return false
      end,
    },
    win_options = {
      signcolumn = "auto:2",
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
