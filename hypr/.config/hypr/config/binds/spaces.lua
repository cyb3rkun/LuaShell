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
	-- Move All Windows from active workspace to numbered workspace
	hl.bind(SUPR .. CTL .. key, function()
		local src = hl.get_active_workspace()
		local u = require "dsp"
		if not src then
			hl.notification.create {
				timeout = 5000,
				text = "No Active workspace",
			}
			return
		end
		hl.dispatch(u.win.move_all_win(src.config_name, key, true))
	end)
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

hl.bind(SUPR .. CTL .. "X", hl.dsp.workspace.toggle_special "games", {
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
