return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              stubs = {
                -- PHP core
                "Core",
                "standard",
                "date",
                "json",
                "mbstring",
                "mysqli",
                "PDO",
                "pdo_mysql",
                "SimpleXML",
                "xml",
                "xmlreader",
                "xmlwriter",
                "curl",
                "gd",
                "intl",
                "zip",
                "zlib",

                -- WordPress
                "wordpress",
                "wordpress-globals",
                "wordpress-multisite",
                "wordpress-cli",

                -- WooCommerce
                "woocommerce",
              },
              environment = {
                --[[ use only absolute paths, no ~ or $HOME ]]
                includePaths = {
                  "/home/eyal/.config/composer/vendor/php-stubs/acf-pro-stubs",
                  "/home/eyal/.config/composer/vendor/php-stubs/woocommerce-stubs",
                  "/home/eyal/.config/composer/vendor/php-stubs/wordpress-stubs",
                  "/home/eyal/.config/composer/vendor/php-stubs/wordpress-globals",
                  "/home/eyal/.config/composer/vendor/php-stubs/wpml-stubs",
                  "/home/eyal/.config/composer/vendor/wpsyntex",
                  "/home/eyal/.config/composer/vendor/arifpavel",
                },
              },
              files = {
                maxSize = 10000000,
              },
            },
          },
        },
      },
    },
  },
}
