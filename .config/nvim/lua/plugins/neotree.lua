return {
	"nvim-neo-tree/neo-tree.nvim",
    enabled =false,
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "current",
			},
		})
	end,
}

