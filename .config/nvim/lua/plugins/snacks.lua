return {
  "snacks.nvim",
  opts = {
    scroll = { enabled = false },
    dim = { enabled = false },
    picker = {
      sources = {
        zen = {
          toggles = {
            dim = false,
            git_signs = false,
            mini_diff_signs = false,
          },
          enter = true,
          fixbuf = false,
          minimal = false,
          width = 80,
          height = 0,
          backdrop = { transparent = true },
          keys = { q = false },
          zindex = 40,
          w = {
            snacks_main = true,
          },
        },
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
