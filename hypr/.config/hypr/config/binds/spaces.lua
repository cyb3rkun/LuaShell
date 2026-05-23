-- Switch workspaces with SUPR[0-9]
-- Move active window to a workspace with SUPRSHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	local wstr = tostring(i)
	hl.bind(SUPR .. key, hl.dsp.focus { workspace = i }, {
		desc = "Focus Workspace " .. wstr,
	})
	hl.bind(
		SUPR .. SHFT .. key,
		hl.dsp.window.move { workspace = i },
		{
			desc = "Move Window to Workspace " .. wstr,
		}
	)
end

hl.bind(SUPR .. "S", hl.dsp.workspace.toggle_special "magic", {
	desc = "Toggle Workspace [special:magic]",
})

hl.bind(
	SUPR .. "SHIFT + S",
	hl.dsp.window.move { workspace = "special:magic" },
	{
		desc = "Move Window to workspace [special:magic]",
	}
)

hl.bind(SUPR .. ALT .. "X", hl.dsp.workspace.toggle_special "games", {
	desc = "Toggle Gaming Workspace",
})
hl.bind(SUPR .. CTL .. "L", hl.dsp.focus { workspace = "name:Laun" }, {
	desc = "Toggle Game Launcher Workspace",
})
hl.bind(
	SUPR .. CTL .. "C",
	hl.dsp.focus { workspace = "name:Comms" },
	{
		desc = "Toggle Game Launcher Workspace",
	}
)
