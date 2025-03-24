return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
          ["D"] = { '"_d', desc = "Delete " },
          ["DD"] = { '"_dd', desc = "Delete line " },
          ["Dw"] = { '"_dw', desc = "Delete word " },
          ["Diw"] = { '"_diw', desc = "Delete inner word " },
          ["Daw"] = { '"_daw', desc = "Delete a word (including space) " },
          ["D$"] = { '"_d$', desc = "Delete to end of line " },
          ["D0"] = { '"_d0', desc = "Delete to start of line " },
          ["<C-d>"] = { "<C-d>zz", desc = "Scroll down" },
          ["<C-u>"] = { "<C-u>zz", desc = "Scroll up" },
          ["<C-j>"] = false,
          ["<C-k>"] = false,
          ["<C-l>"] = false,
          ["<C-h>"] = false,
        },
        v = {
          ["D"] = { '"_d', desc = "Delete selection" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
