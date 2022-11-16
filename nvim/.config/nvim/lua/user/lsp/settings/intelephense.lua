--[[ befor using you need to follow this article: https://daniele.tech/2021/07/neovim-lsp-with-intelephense-for-php-and-wordpress-and-others/ ]]
return {
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
              includePaths = {'/home/eyal/.config/composer/vendor/php-stubs', '/home/eyal/.config/composer/vendor/wpsyntex','/home/eyal/.config/composer/vendor/arifpavel'}
            },
            files = {
                maxSize = 5000000;
            };
        };
    },}
