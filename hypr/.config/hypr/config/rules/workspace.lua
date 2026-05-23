local monitors = {
	"desc:Dell Inc. DELL SE2425HG 17LTB84",
	"desc:LG Electronics W2242 0x00039907",
	"desc:Lenovo Group Limited 0x1144 VN-66718",
}

hl.workspace_rule { workspace = "s[true]", gaps_out = 6 }

for i = 1, 9 do
	local monitor_idx = math.ceil(i / 3)
	hl.workspace_rule {
		workspace = tostring(i),
		monitor = monitors[monitor_idx],
		persistent = true,
	}
end

local spcace_l = {
	{ workspace = "special:games", monitor = "DP-1" },
	{ workspace = "name:Comms", monitor = "DP-2" },
	{ workspace = "name:Laun", monitor = "DP-2" },
}

for _, w in ipairs(spcace_l) do
	hl.workspace_rule(w)
end

