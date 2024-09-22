-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Telescope to open files when a directory is passed as an argument
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        vim.cmd("Telescope find_files cwd=" .. vim.fn.argv(0))
      end
    end
  end,
})

-- Show diagnostics on hover (when CursorHold event is triggered)
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})
