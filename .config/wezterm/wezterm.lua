local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Catppuccin Mocha palette
local colors = {
	blue = "#89B4FA",
	base = "#1E1E2E",
	crust = "#11111B",
	surface0 = "#313244",
	overlay2 = "#9399B2",
	text = "#CDD6F4",
}

config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 100

wezterm.on("format-tab-title", function(tab)
	local title = tab.tab_title ~= "" and tab.tab_title or tab.active_pane.title
	title = wezterm.truncate_right(title, 24)

	local bg = colors.surface0
	local fg = colors.overlay2
	local icon = wezterm.nerdfonts.md_tab
	local pad = "  "

	if tab.is_active then
		bg = colors.blue
		fg = colors.base
		icon = wezterm.nerdfonts.linux_tux
	end

	return {
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = pad .. icon .. " " .. title .. pad },
	}
end)

config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })
config.font_size = 15
config.window_padding = { left = 20, right = 20, top = 0, bottom = 0 }

-- Keybindings
config.keys = {
	{ key = "h", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "l", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "t", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "q", mods = "ALT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
	{ key = "r", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "x", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
}

config.enable_wayland = false

return config
