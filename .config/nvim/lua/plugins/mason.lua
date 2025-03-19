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
					"gopls", -- Golang
					"ts_ls", -- JavaScript/TypeScript
					"eslint", -- ESLint
					"html", -- HTML
					"cssls", -- CSS
					"tailwindcss", -- Tailwind CSS
					"jsonls", -- JSON
					"emmet_ls", -- Emmet
					"volar", -- Vue.js
					"lua_ls", -- Lua
					"bashls", -- Bash scripting
					"yamlls", -- YAML
					"dockerls", -- Docker
					"marksman", -- Markdown
				},
			})
		end,
	},
}
