local monitors = {
	"desc:Dell Inc. DELL SE2425HG 17LTB84",
	"desc:LG Electronics W2242 0x00039907",
	"desc:Lenovo Group Limited 0x1144 VN-66718",
}

hl.workspace_rule({workspace = "s[true]", gaps_out = 6})

for i = 1, 9 do
	local monitor_idx = math.ceil(i / 3)
	hl.workspace_rule {
		workspace = tostring(i),
		monitor = monitors[monitor_idx],
		persistent = true,
	}
end

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
