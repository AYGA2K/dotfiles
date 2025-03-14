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
      "<C-j>",
      function() require("harpoon"):list():add() end,
      desc = "Harpoon file",
    },
    {
      "<C-k>",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon quick menu",
    },
    {
      "<C-h>",
      function()
        local harpoon = require "harpoon"
        harpoon:list():prev()
      end,
      desc = "Harpoon to previous file",
    },
    {
      "<C-l>",
      function()
        local harpoon = require "harpoon"
        harpoon:list():next()
      end,
      desc = "Harpoon to next file",
    },
  },
}
