-- Special Workspaces

hl.bind(SUPR .. ALT .. "X", hl.dsp.workspace.toggle_special "games", {
	desc = "Toggle Gaming Workspace",
})
hl.bind(SUPR .. ALT .. "L", hl.dsp.focus { workspace = "name:Laun" }, {
	desc = "Toggle Game Launcher Workspace",
})
