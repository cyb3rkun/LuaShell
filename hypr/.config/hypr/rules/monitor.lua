local M = {}
function M.monitors(ems)
	for _, m in ipairs(ems) do
		-- Helper function that assings a range of workspaces to a monitor
		local function range(start, stop)
			for i = tonumber(start), tonumber(stop) do
				hl.workspace_rule {
					workspace = tostring(i),
					monitor = m[1],
					persistent = m.persistent,
				}
			end
		end
		local function id(wsid)
			hl.workspace_rule {
				workspace = tostring(wsid),
				monitor = m[1],
				persistent = m.persistent,
			}
		end
		---@param t table<number>
		local function tbl(t)
			for _, wsid in ipairs(t) do
				hl.workspace_rule {
					workspace = tostring(wsid),
					monitor = m[1],
					persistent = m.persistent,
				}
			end
		end

		if type(m.workspaces) == "string" then
			local start, stop = m.workspaces:match "(%d+)%-(%d+)"
			if start and stop then range(start, stop) end

			local wid = m.workspaces:match "^(%d+)$"
			if wid then id(wid) end
		elseif type(m.workspaces) == "number" then
			id(m.workspaces)
		elseif type(m.workspaces) == "table" then
			---@diagnostic disable-next-line: param-type-mismatch
			tbl(m.workspaces)
		end
	end
end
return M
