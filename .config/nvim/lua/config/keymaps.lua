-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

map("n", "<leader><leader>", function()
  Snacks.picker.files({
    hidden = true,
  })
end, { desc = "Find Files" })

map("n", "<leader>e", function()
  Snacks.picker.explorer({
    ignored = true,
    hidden = true,
  })
end, { desc = "Explorer (cwd)" })

map("n", "<leader>E", function()
  Snacks.picker.explorer({
    cwd = LazyVim.root(),
    hidden = false,
    ignored = false,
  })
end, { desc = "Explorer (root dir)" })

map("n", "<leader>fe", function()
  Snacks.picker.explorer({
    git_untracked = false,
  })
end, { desc = "Explorer Git Untracked (cwd)" })

map("n", "<leader>fE", function()
  Snacks.picker.explorer({
    cwd = LazyVim.root(),
    ignored = true,
    hidden = true,
  })
end, { desc = "Explorer Git Untracked (root dir)" })

map("n", "<leader>fu", function()
  Snacks.picker.files({
    hidden = true,
    ignored = true,
  })
end, { desc = "Find Files Git Untracked (cwd)" })

map("n", "<leader>fU", function()
  Snacks.picker.files({
    cwd = LazyVim.root(),
    git_untracked = true,
  })
end, { desc = "Find Files Git Untracked (root dir)" })

map("v", "D", '"_d', { desc = "Delete" })
map("n", "DD", '"_dd', { desc = "Delete line" })

map("n", "Dw", '"_dw', { desc = "Delete word" })
map("n", "Diw", '"_diw', { desc = "Delete inner word" })
map("n", "D2w", '"_d2w', { desc = "Delete two words" })
map("n", "D$", '"_d$', { desc = "Delete to end of line" })
map("n", "D0", '"_d0', { desc = "Delete to beginning of line" })
map("n", "Dgg", '"_dgg', { desc = "Delete to beginning of file" })
map("n", "DG", '"_dG', { desc = "Delete to end of file" })
map("n", "Dap", '"_dap', { desc = "Delete a paragraph" })
map("n", 'Da"', '"_da"', { desc = "Delete a quoted string" })
map("n", "Da'", "\"_da'", { desc = "Delete a single quoted string" })
map("n", "Da(", '"_da(', { desc = "Delete a parenthesis block" })
map("n", "Da[", '"_da[', { desc = "Delete a bracket block" })
map("n", "Da{", '"_da{', { desc = "Delete a curly bracket block" })
map("n", "<leader>z", function()
  Snacks.zen.zen()
  Snacks.dim.disable()
end, { desc = "Toggle ZenMode" })
map("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Obsidian Open" })
map("n", "<leader>oqw", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian Quick Switch" })

map("n", "<leader>ife", function()
  local lines = {
    "if err != nil {",
    "\treturn err",
    "}",
  }
  vim.api.nvim_put(lines, "l", true, true)
end, { desc = "Insert if err != nil snippet" })
