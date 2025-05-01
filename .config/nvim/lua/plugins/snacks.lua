return {
  "snacks.nvim",
  opts = {
    scroll = { enabled = false },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          layout = {
            preset = "vertical",
            layout = {
              box = "horizontal",
              width = 0.8,
              min_width = 120,
              height = 0.98,
              {
                box = "vertical",
                border = "rounded",
                title = "{title} {live} {flags}",
                { win = "list", border = "none" },
              },
              { win = "preview", title = "{preview}", width = 0.5, border = "rounded" },
            },
          },
          auto_close = true,
        },
      },
    },
  },
}
