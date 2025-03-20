-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Configure diagnostics to show only icons and hide inline messages
vim.diagnostic.config({
	virtual_text = false, -- Disable inline text for diagnostics
	signs = true, -- Keep icons in the sign column
})

-- Load configuration files
require("config.settings")
require("config.options")
require("config.keybindings")
require("config.autocommands")

-- Load Lazy.nvim and plugins
require("lazy").setup("plugins")
