local Ncomspace = "name:Comms"
local Scomspace = "special:comms"

hl.bind(SUPR .. ALT .. "E", function()
	local dsp = require "dsp"

	if not hl.get_workspace(Scomspace) then
		hl.dispatch(dsp.win.move_all_win(Ncomspace, Scomspace, true))
	else
		hl.dispatch(dsp.win.move_all_win(Scomspace, Ncomspace, false))
		hl.dispatch(hl.dsp.workspace.toggle_special "comms")
	end
end)
