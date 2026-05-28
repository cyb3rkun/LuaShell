-- Configure You're Monitor Workspaces Declaratively here
local monitor_workspaces = {
	{
		"DP-1",
		workspaces = "1-8",
		persistent = true,
	},
	{
		"desc:LG Electronics W2242 0x00039907",
		workspaces = "7-8",
		persistent = true,
	},
	{
		"desc:Lenovo Group Limited 0x1144 VN-66718",
		workspaces = "9-10",
		persistent = true,
	},
}
--
-- Take a look at rules.monitors for more details.
require("rules.monitor").monitors(monitor_workspaces)

hl.workspace_rule { workspace = "s[true]", gaps_out = 6 }

-- Special Workspace Rules
local spcace_l = {
	{ workspace = "special:games", monitor = "DP-1" },
	{ workspace = "name:Comms", monitor = "DP-2" },
	{ workspace = "name:Laun", monitor = "DP-2" },
}

for _, w in ipairs(spcace_l) do
	hl.workspace_rule(w)
end
