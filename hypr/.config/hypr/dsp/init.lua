---@class DSP
local M = {}
M.win = {}
---@param source HL.WorkspaceSelector
---@param dest HL.WorkspaceSelector
---@param follow boolean # Whether or not the focus should follow the windows.
---@return function # The custom dispatcher closure to be executed by Hyprland
function M.win.move_all_win(source, dest, follow)
	return function()
		local source_ws = hl.get_workspace(source)
		if not source_ws then
			hl.notification.create {
				timeout = 5000,
				text = "source does not exist",
				icon = "info",
			}
			return
		end

		local windows = source_ws:get_windows()

		for _, window in ipairs(windows) do
			hl.dispatch(hl.dsp.window.move {
				window = window,
				workspace = dest,
				follow = follow,
			})
		end
	end
end

return M
