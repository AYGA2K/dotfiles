return {
    "stevearc/conform.nvim",
    opts = {
        format_on_save = true,

        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            vue = { "prettier" },
            go = { "gofmt" },
            python = { "black" },
        },
    },
}
