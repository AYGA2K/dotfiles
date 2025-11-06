return {
  "snacks.nvim",
  opts = {
    scroll = { enabled = false },
    dim = { enabled = false },
    dashboard = {},
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
          backdrop = { transparent = false },
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
              width = 0.7,
              -- min_width = 120,
              height = 0.8,
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
        picker = {
          layout = {
            width = 0.7,
            height = 0.5,
          },
        },

        files = {
          layout = {
            preview = false, -- Disable preview for file picker
          },
        },
      },
    },
  },
}
