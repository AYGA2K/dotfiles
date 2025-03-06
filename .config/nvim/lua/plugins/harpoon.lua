return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
  },
  keys = {
    {
      "<C-S-j>",
      function() require("harpoon"):list():add() end,
      desc = "Harpoon file",
    },
    {
      "<C-S-k>",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon quick menu",
    },
    {
      "<C-S-h>",
      function()
        local harpoon = require "harpoon"
        harpoon:list():prev()
      end,
      desc = "Harpoon to previous file",
    },
    {
      "<C-S-l>",
      function()
        local harpoon = require "harpoon"
        harpoon:list():next()
      end,
      desc = "Harpoon to next file",
    },
  },
}
