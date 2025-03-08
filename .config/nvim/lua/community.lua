-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.recipes.disable-tabline" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.hyprlang" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.file-explorer.mini-files" },
}
