hl.on("hyprland.start", function()
	hl.exec_cmd "quickshell"
	hl.exec_cmd "mako"
	hl.dispatch(hl.dsp.focus { workspace = 4 })
	hl.dispatch(hl.dsp.focus { workspace = 1 })
end)
