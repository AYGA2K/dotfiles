-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- Autoformat on save
-- vim.api.nvim_create_autocmd('BufWritePre', {
--     pattern = '*',
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
