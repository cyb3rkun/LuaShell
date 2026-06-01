-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(
	SUPR .. "V",
	hl.dsp.window.float { action = "toggle" },
	{ desc = "Toggle Float" }
)
hl.bind(
	SUPR .. CTL .. "V",
	hl.dsp.window.cycle_next { floating = true },
	{ desc = "Cycle through floating windows" }
)
hl.bind(
	SUPR .. CTL .. "Z",
	hl.dsp.window.cycle_next { floating = false, tiled = true },
	{ desc = "Cycle through floating windows" }
)
hl.bind(
	SUPR .. "F",
	hl.dsp.window.fullscreen { action = "toggle" },
	{ desc = "Toggle Fullscreen" }
)
-- hl.bind(SUPR .. "P", hl.dsp.window.pseudo())
hl.bind(
	SUPR .. SHFT .. "I",
	hl.dsp.layout "togglesplit",
	{ desc = "Toggle Split Horizontal/Vertical" }
) -- dwindle only
--

-- -- Move/resize windows with SUPRLMB/RMB and dragging
hl.bind(
	SUPR .. "mouse:272",
	hl.dsp.window.drag(),
	{ mouse = true, desc = "Move Window By dragging Mouse" }
)
hl.bind(
	SUPR .. "mouse:273",
	hl.dsp.window.resize(),
	{ mouse = true, desc = "Resize Window By draggin mouse" }
)
