return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = false,
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
    {
      "<C-1>",
      function() require("harpoon"):list():select(1) end,
      desc = "Harpoon to file 1",
    },
    {
      "<C-2>",
      function() require("harpoon"):list():select(2) end,
      desc = "Harpoon to file 2",
    },
    {
      "<C-3>",
      function() require("harpoon"):list():select(3) end,
      desc = "Harpoon to file 3",
    },
    {
      "<C-4>",
      function() require("harpoon"):list():select(4) end,
      desc = "Harpoon to file 4",
    },
    {
      "<C-5>",
      function() require("harpoon"):list():select(5) end,
      desc = "Harpoon to file 5",
    },
  },
}
