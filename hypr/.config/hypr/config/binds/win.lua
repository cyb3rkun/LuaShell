local directions = {
	{ "h", "left", { x = -10, y = 0 } },
	{ "j", "down", { x = 0, y = 10 } },
	{ "k", "up", { x = 0, y = -10 } },
	{ "l", "right", { x = 10, y = 0 } },
}

for _, d in ipairs(directions) do
	hl.bind(
		SUPR .. d[1],
		hl.dsp.focus { direction = d[2] },
		{ desc = "Focus Window " .. d[2] }
	)
	hl.bind(
		SUPR .. SHFT .. d[1],
		hl.dsp.window.move { direction = d[2] },
		{ desc = "Move Window " .. d[2] }
	)
end
hl.bind(
	SUPR .. "R",
	hl.dsp.submap "resize",
	{ desc = "Enter Resize Submap" }
)
hl.define_submap("resize", function()
	for _, d in ipairs(directions) do
		hl.bind(
			d[1],
			hl.dsp.window.resize {
				x = d[3].x,
				y = d[3].y,
				relative = true,
			},
			{ repeating = true, desc = "Resize Window to " .. d[2] }
		)
	end
	hl.bind(
		ESC,
		hl.dsp.submap "reset",
		{ desc = "Exit resize Submap" }
	)
end)
