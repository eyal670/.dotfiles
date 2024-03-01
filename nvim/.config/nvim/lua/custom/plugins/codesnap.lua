return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = "CodeSnapPreviewOn",
  config = function(_, opts)
    require("codesnap").setup(opts)
  end
}
