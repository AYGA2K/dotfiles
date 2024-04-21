local wezterm = require("wezterm")

local config = {}
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 20
config.line_height = 0.9
config.colors = {
	tab_bar = {
		background = "#1e1e2e",
		inactive_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#bac2de",
		},
		active_tab = {
			bg_color = "#313244",
			fg_color = "#89dceb",
		},
	},
}
-- config.scrollback_lines = 3000

config.window_padding = {
	left = 200,
	right = 200,
	top = 0,
	bottom = 0,
}
-- Tab bar
config.use_fancy_tab_bar = false
-- config.status_update_interval = 1000
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = true
config.disable_default_key_bindings = true
-- config.cursor_blink_rate = 80

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{ event = { Up = { streak = 1, button = "Left" } }, mods = "CTRL", action = wezterm.action.OpenLinkAtMouseCursor },
}
config.enable_wayland = false
local act = wezterm.action

config.keys = {
	{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },

	{ key = "t", mods = "ALT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },

	{ key = "q", mods = "ALT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "v", mods = "ALT", action = wezterm.action.ActivateCopyMode },

	{ key = "h", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "l", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },

	{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "C", mods = "CTRL", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },

	{ key = "U", mods = "ALT|SHIFT", action = act.ScrollByPage(-0.5) },
	{ key = "D", mods = "ALT|SHIFT", action = act.ScrollByPage(0.5) },

	{ key = "V", mods = "ALT|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "Z", mods = "ALT|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- navigate between splits
	{ key = "H", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "L", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "K", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "J", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Down") },
	-- close current split
	{ key = "Q", mods = "ALT|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },
}

return config
