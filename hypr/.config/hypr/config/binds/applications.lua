hl.bind(SUPR .. ENTR, hl.dsp.exec_cmd(TERM))
hl.bind(SUPR .. "Q", hl.dsp.window.close())
-- -- closeWindowBind:set_enabled(false)
hl.bind(SUPR .. "E", hl.dsp.exec_cmd(FM))
hl.bind(SUPR .. "D", hl.dsp.exec_cmd(LAUNCHER))

-- Screenshots
hl.bind(
	"PRINT",
	hl.dsp.exec_cmd "grimblast copysave area ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png"
)
hl.bind(
	CTL .. "PRINT",
	hl.dsp.exec_cmd "grimblast copysave active ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png"
)
hl.bind(
	ALT .. "print",
	hl.dsp.exec_cmd "grimblast copysave output ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png"
)
