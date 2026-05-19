-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- This defines a Fallback monitor setup.
-- this will only get applied if another monitor rule doesn't match
-- you're monitor
hl.monitor {
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
}
---
---@type HL.MonitorSpec[]
-- Modify monitor configuration to fit you're own setup.

local monitors = {
	{
		output = "desc:Dell Inc. DELL SE2425HG 17LTB84",
		position = "0x0",
		mode = "1920x1080@200",
		scale = 1,
		vrr = true,
		cm = "srgb",
	},
	{
		output = "desc:LG Electronics W2242 0x00039907",
		mode = "1680x1050",
		position = "auto-center-left",
		scale = 1,
		transform = 3,
	},
	{
		output = "desc:Lenovo Group Limited 0x1144 VN-66718",
		position = "auto-center-right",
		mode = "1920x1200",
		scale = 1,
	},
}

for _, m in ipairs(monitors) do
	hl.monitor(m)
end
