return {
  "neovim/nvim-lspconfig",
  opts = {
    on_attach = function(client, bufnr)
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Go to definition
      keymap("n", "gd", vim.lsp.buf.definition, opts)

      -- Add more keymaps if needed
    end,
  },
}
