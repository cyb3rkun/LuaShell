local wezterm = require("wezterm")
local config = wezterm.config_builder()
local color_scheme = require("colorscheme")

config.enable_wayland = true

-- Font Settings
config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font = wezterm.font_with_fallback({
	"Jetbrains Mono Nerd Font",
	"M+1 Nerd Font",
	"M+1Code Nerd Font",
	"devicons",
	"icomoon Regular",
	"Fira Code",
})
config.font_size = 10

-- TODO: Change for custom colorscheme
config.color_scheme = "Tokyo Night Moon"
config.colors = {
	background = "black",
}
config.window_background_opacity = 0.4
config.enable_tab_bar = false
config.window_padding = {
	left = "1cell",
	top = "0cell",
	bottom = "0cell",
	right = "0cell"
}

return config
