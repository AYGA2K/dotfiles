local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

---------------------
-- General Keymaps --
---------------------

-- Save file
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>", opts)

-- Quit Neovim
map("n", "<Leader>q", ":quitall!<CR>", opts)

-- Open Neotree (file explorer)
map("n", "<Leader>e", ":Neotree reveal toggle<CR>", opts) -- <Space>e to toggle Neotree

-- Harpoon Keymaps

map("n", "<C-j>", ':lua require("harpoon"):list():add()<CR>', opts) -- Harpoon add file

map("n", "<C-k>", ':lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>', opts) -- Harpoon quick menu

map("n", "<C-h>", ':lua require("harpoon"):list():prev()<CR>', opts) -- Harpoon to previous file

map("n", "<C-l>", ':lua require("harpoon"):list():next()<CR>', opts) -- Harpoon to next file

---------------------
-- LSP Keymaps --
---------------------

-- LSP general keybindings
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
map("n", "<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "<Leader>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<Leader>l", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
map("n", "<Leader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<Leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<Leader>o", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts) -- Go to previous diagnostic
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts) -- Go to next diagnostic

-- Key mapping for showing diagnostics in a floating window
map("n", "K", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
