return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      php = { "phpcs" },
    },
    linters = {
      phpcs = {
        cmd = "phpcs",
        args = { "--standard=PSR12" }, -- Use PSR-12 instead of PEAR
      },
    },
  },
}
