local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  'rust_analyzer',
  'intelephense',
})

lsp.configure('intelephense', {
  settings = {
    intelephense = {
      stubs = {
        "bcmath",
        "bz2",
        "Core",
        "curl",
        "date",
        "dom",
        "elementor-stubs",
        "fileinfo",
        "filter",
        "gd",
        "gettext",
        "hash",
        "iconv",
        "imap",
        "intl",
        "json",
        "libxml",
        "mbstring",
        "mcrypt",
        "mysql",
        "mysqli",
        "password",
        "pcntl",
        "pcre",
        "PDO",
        "pdo_mysql",
        "Phar",
        "readline",
        "regex",
        "session",
        "SimpleXML",
        "sockets",
        "sodium",
        "standard",
        "superglobals",
        "tokenizer",
        "xml",
        "xdebug",
        "xmlreader",
        "xmlwriter",
        "yaml",
        "zip",
        "zlib",
        "wordpress-stubs",
        "woocommerce-stubs",
        "acf-pro-stubs",
        "wordpress-globals",
        "polylang-stubs",
      },
      environment = {
        --[[ use only absolute paths, no ~ or $HOME ]]
        includePaths = { '/home/eyal/.config/composer/vendor/php-stubs', '/home/eyal/.config/composer/vendor/wpsyntex',
          '/home/eyal/.config/composer/vendor/arifpavel' }
      },
      files = {
        maxSize = 10000000,
      },
    },
  },
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "definition" }, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "hover" }, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { desc = "workspace symbol" }, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "diagnostic window" }, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "diagnostic next" }, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "diagnostic prev" }, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { desc = "code actions" }, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { desc = "references" }, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { desc = "rename" }, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "signature help" }, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
