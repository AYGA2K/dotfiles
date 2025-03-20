return {
	{
		"echasnovski/mini.nvim",
		version = "*",
	},

	{ "echasnovski/mini.comment", version = "*" },
	{
		"echasnovski/mini.surround",
		version = "*",
	},
	{
		"echasnovski/mini.pairs",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
	},

	{
		"echasnovski/mini.snippets",
		dependencies = "rafamadriz/friendly-snippets",
		event = "InsertEnter", -- don't depend on other plugins to load...
		-- :h MiniSnippets-examples:
		opts = function()
			local snippets = require("mini.snippets")
			return { snippets = { snippets.gen_loader.from_lang() } }
		end,
	},

	{ -- do read the installation section in the readme of nvim-cmp!
		"hrsh7th/nvim-cmp",
		main = "cmp",
		dependencies = { "abeldekat/cmp-mini-snippets" }, -- this plugin
		event = "InsertEnter",
		opts = function()
			local cmp = require("cmp")
			return {
				snippet = {
					expand = function(args) -- mini.snippets expands snippets from lsp...
						local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
						insert({ body = args.body }) -- Insert at cursor
						cmp.resubscribe({ "TextChangedI", "TextChangedP" })
						require("cmp.config").set_onetime({ sources = {} })
					end,
				},
				sources = cmp.config.sources({ { name = "mini_snippets" } }),
				mapping = cmp.mapping.preset.insert(), -- more opts...
			}
		end,
	},
}
