return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        window = {
          width = 25,
        },
      },
    },
  },
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      timeout = 300,
    },
  },
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "stevearc/dressing.nvim", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
  { "nvimdev/dashboard-nvim", enabled = false },
  { "dstein64/vim-startuptime", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },
  { "folke/todo-comments.nvim", enabled = false },
  { "RRethy/vim-illuminate", enabled = false },
  { "nvim-pack/nvim-spectre", enabled = false },
  { "lewis6991/gitsigns.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
}
