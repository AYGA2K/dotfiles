-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
  command = "lua if vim.fn.argc(-1) == 1 then local stat = vim.loop.fs_stat(vim.fn.argv(0)) if stat and stat.type == 'directory' then vim.cmd('Telescope find_files cwd=' .. vim.fn.argv(0)) end end",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("filetype"),
  callback = function()
    vim.filetype.add({
      extension = {
        templ = "templ",
      },
    })
  end,
})

-- Format current buffer using LSP.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("format"),
  callback = function()
    vim.api.nvim_create_autocmd({
      -- 'BufWritePre' event triggers just before a buffer is written to file.
      "BufWritePre",
    }, {
      pattern = { "*.templ" },
      callback = function()
        -- Format the current buffer using Neovim's built-in LSP (Language Server Protocol).
        vim.lsp.buf.format()
      end,
    })
  end,
})

-- Rempve inline text of diagnostics
vim.api.nvim_create_autocmd("BufReadPre", {
  group = augroup("diagnostics"),
  callback = function()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
    })
  end,
})
