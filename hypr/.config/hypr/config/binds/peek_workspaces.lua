local Ncomspace = "name:Comms"
local Scomspace = "special:comms"

local dsp = require "dsp"
hl.bind(SUPR .. ALT .. "E", function()
	if not hl.get_workspace(Scomspace) then
		hl.dispatch(dsp.win.move_all_win(Ncomspace, Scomspace, true))
	else
		hl.dispatch(dsp.win.move_all_win(Scomspace, Ncomspace, false))
		hl.dispatch(hl.dsp.workspace.toggle_special "comms")
	end
end)

for i = 1, 9 do
	hl.bind(SUPR .. ALT .. tostring(i), function()
		local spw = hl.get_active_special_workspace()
		local peek_name = "special:peek-" .. tostring(i)

		if spw then
			hl.dispatch(dsp.win.move_all_win(spw, tostring(i), false))

			-- NOTE: Without toggling the special workspace twice,  the
			-- special workspace will stay active above the current
			-- workspace even if it's empty, only toggling it once has
			-- same behaviour
			hl.dispatch(hl.dsp.workspace.toggle_special(peek_name))
			hl.dispatch(hl.dsp.workspace.toggle_special(peek_name))
		else
			hl.dispatch(
				dsp.win.move_all_win(tostring(i), peek_name, true)
			)
		end
	end)
end
