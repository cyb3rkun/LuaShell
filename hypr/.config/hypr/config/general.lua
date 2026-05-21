hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 10,

		border_size = 1,

		col = {
			active_border = { colors = { "#6587b9" }, angle = 45 },
			inactive_border = "#40526c9c",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 18,
		rounding_power = 1,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		-- TODO: Only do shadow on active application
		shadow = {
			enabled = true,
			range = 18,
			render_power = 8,
			color = "#191a2480",
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 1,
			vibrancy = 0.1696,
			xray = true,
		},
	},

	animations = {
		enabled = true,
	},
})
