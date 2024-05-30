return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        window = {
          width = 30,
        },
      },
    },
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   enabled = true,
  --   opts = {
  --     timeout = 300,
  --   },
  -- },
  { "akinsho/bufferline.nvim", enabled = false },
}
