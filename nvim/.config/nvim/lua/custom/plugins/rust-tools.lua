return {
  'simrat39/rust-tools.nvim',
  ft = "rust",
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { 'nvim-lua/plenary.nvim' }, -- Required
    { 'mfussenegger/nvim-dap' }, -- Required
  }

}
