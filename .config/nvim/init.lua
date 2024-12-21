-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Load custom snippets from a specific directory
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/snippets" } })
