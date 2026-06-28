return {
  -- Linting para PHP con phpcs y phpstan
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = { "phpstan" },
      },
    },
  },
  -- Mason: instalar phpcs y phpstan automáticamente
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "phpstan",
        "php-cs-fixer",
      },
    },
  },
}
