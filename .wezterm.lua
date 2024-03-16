local wezterm = require("wezterm")

local config = {}
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 15
config.line_height = 1
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
	left = 100,
	right = 100,
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
-- config.enable_wayland = false
local act = wezterm.action

config.keys = {
	-- Switch tabs using Alt + 1, 2, 3, ...
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
	{ key = "U", mods = "CTRL", action = act.ScrollByPage(-0.5) },
	{ key = "D", mods = "CTRL", action = act.ScrollByPage(0.5) },
}

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
