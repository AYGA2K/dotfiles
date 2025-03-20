-- Configure diagnostics to show only icons in the sign column and floating windows
vim.diagnostic.config({
	virtual_text = false, -- Disable inline text for diagnostics
	signs = true, -- Enable icons in the sign column
})

-- Optional: Customize diagnostic icons
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
