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
config.window_frame = {
    font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
    font_size = 11.0,
    active_titlebar_bg = colors.base,
    inactive_titlebar_bg = colors.crust,
}

config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 100
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

wezterm.on("format-tab-title", function(tab)
    local title = tab.tab_title ~= "" and tab.tab_title or tab.active_pane.title
    title = wezterm.truncate_right(title, 24)

    local bg = colors.base
    local fg = colors.overlay2
    local icon = wezterm.nerdfonts.linux_tux
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
-- config.show_close_tab_button_in_tabs = false
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 17
config.window_padding = { left = 150, right = 150, top = 0, bottom = 0 }

-- Keybindings
config.keys = {
    { key = "h",          mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
    { key = "l",          mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
    { key = "t",          mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "q",          mods = "ALT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
    { key = "r",          mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "d",          mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "LeftArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
    { key = "UpArrow",    mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "DownArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "x",          mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
}

config.enable_wayland = false

return config
