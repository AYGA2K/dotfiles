return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "current",
    },
  },
  keys = {
    {
      "<leader>e",
      function() require("neo-tree.command").execute { toggle = true, reveal = true } end,
      desc = "Toggle Explorer",
    },
  },
}
