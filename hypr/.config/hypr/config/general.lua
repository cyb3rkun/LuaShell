hl.config {
	general = {
		gaps_in = 2,
		gaps_out = {
			top = 2,
			right = 8,
			left = 8,
			bottom = 8,
		},

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
}
-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config {
	dwindle = {
		preserve_split = true, -- You probably want this
	},
}

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config {
	master = {
		new_status = "master",
	},
}

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config {
	scrolling = {
		fullscreen_on_one_column = true,
	},
}

----------------
----  MISC  ----
----------------

hl.config {
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
}
