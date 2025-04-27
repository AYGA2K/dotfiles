return {
  "snacks.nvim",
  opts = {
    scroll = { enabled = false },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          layout = {
            preset = "vertical", -- Start with vertical layout as base
            layout = {
              box = "horizontal",
              width = 0.8,
              min_width = 120,
              height = 0.8,
              {
                box = "vertical",
                border = "rounded",
                title = "{title} {live} {flags}",
                { win = "list", border = "none" }, -- Remove input window
              },
              { win = "preview", title = "{preview}", width = 0.5, border = "rounded" },
            },
          },
          auto_close = true, -- Close explorer after selecting file
        },
      },
    },
  },
}
