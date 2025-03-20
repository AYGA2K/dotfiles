return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" }, -- Load only when needed
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "go", "javascript", "html", "css", "json", "php", "vue" },
			highlight = { enable = true }, -- Enable syntax highlighting
			indent = { enable = true }, -- Enable indentation
			incremental_selection = { enable = true },
			autotag = { enable = true }, -- If using HTML/JSX
		})
	end,
}
