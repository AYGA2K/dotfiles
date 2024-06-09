-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

map("v", "D", '"_d', { desc = "Delete" })
map("n", "Dd", '"_dd', { desc = "Delete line" })

map("n", "dw", '"_dw', { desc = "Delete word" })
map("n", "diw", '"_diw', { desc = "Delete inner word" })
map("n", "d2w", '"_d2w', { desc = "Delete two words" })
map("n", "d$", '"_d$', { desc = "Delete to end of line" })
map("n", "d0", '"_d0', { desc = "Delete to beginning of line" })
map("n", "dgg", '"_dgg', { desc = "Delete to beginning of file" })
map("n", "dG", '"_dG', { desc = "Delete to end of file" })
map("n", "d2j", '"_d2j', { desc = "Delete two lines below" })
map("n", "d2k", '"_d2k', { desc = "Delete two lines above" })
map("n", "dap", '"_dap', { desc = "Delete a paragraph" })
map("n", 'da"', '"_da"', { desc = "Delete a quoted string" })
map("n", "da'", "\"_da'", { desc = "Delete a single quoted string" })
map("n", "da(", '"_da(', { desc = "Delete a parenthesis block" })
map("n", "da[", '"_da[', { desc = "Delete a bracket block" })
map("n", "da{", '"_da{', { desc = "Delete a curly bracket block" })

map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "ZenMode" })
