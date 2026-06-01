local M = {}
local js = require "ljson"
local home = os.getenv "HOME"

Colors = require "vars.colors"
local function get_colors()
	local colors_file, err =
		io.open(home .. "/.config/lua-shell/colors.json", "r")

	if (not colors_file) or err then
		hl.notification.create {
			timeout = 5000,
			text = "Error readding colors file: " .. tostring(err),
		}
		return
	end

	local colors_s = colors_file:read "*a"
	colors_file:close()

	return js.decode(colors_s)
end

-- _G.Colors = get_colors() or {}
function M.update_colors()
	local new_colors = get_colors()
	if not new_colors then return end

	for k, v in pairs(new_colors) do
		Colors[k] = v
	end
end

M.update_colors()
return M
