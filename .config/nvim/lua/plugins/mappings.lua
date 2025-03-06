return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          -- ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          -- ["<Leader>b"] = { desc = "Buffers" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
          ["<C-d>"] = { "<C-d>zz", desc = "Scroll down" },
          ["<C-u>"] = { "<C-u>zz", desc = "Scroll up" },
          ["DD"] = { '"_dd', desc = "Delete line" },
          ["Dw"] = { '"_dw', desc = "Delete word" },
          ["Diw"] = { '"_diw', desc = "Delete inner word" },
          ["D2w"] = { '"_d2w', desc = "Delete two words" },
          ["D$"] = { '"_d$', desc = "Delete to end of line" },
          ["D0"] = { '"_d0', desc = "Delete to beginning of line" },
          ["Dgg"] = { '"_dgg', desc = "Delete to beginning of file" },
          ["DG"] = { '"_dG', desc = "Delete to end of file" },
          ["Dap"] = { '"_dap', desc = "Delete a paragraph" },
          ['Da"'] = { '"_da"', desc = "Delete a quoted string" },
          ["Da'"] = { "\"_da'", desc = "Delete a single quoted string" },
          ["Da("] = { '"_da(', desc = "Delete a parenthesis block" },
          ["Da["] = { '"_da[', desc = "Delete a bracket block" },
          ["Da{"] = { '"_da{', desc = "Delete a curly bracket block" },
        },
        v = {
          ["D"] = { '"_d', desc = "Delete" },
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
