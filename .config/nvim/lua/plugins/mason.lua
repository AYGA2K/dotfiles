return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls", -- golang
					"ts_ls", -- javascript/typescript
					"eslint", -- eslint
					"html", -- html
					"cssls", -- css
					"tailwindcss", -- tailwind css
					"jsonls", -- json
					"emmet_ls", -- emmet
					"volar", -- vue.js
					"lua_ls", -- lua
					"bashls", -- bash scripting
					"yamlls", -- yaml
					"dockerls", -- docker
					"marksman", -- markdown
				},
			})
		end,
	},
}
