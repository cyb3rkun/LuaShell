hl.bind(
	SUPR .. ENTR,
	hl.dsp.exec_cmd(TERM),
	{ desc = "Launch the Terminal Application" }
)
hl.bind(
	SUPR .. "Q",
	hl.dsp.window.close(),
	{ desc = "Close the Focused Window" }
)
-- -- closeWindowBind:set_enabled(false)
hl.bind(
	SUPR .. "E",
	hl.dsp.exec_cmd(FM),
	{ desc = "Launch the File Manager" }
)
hl.bind(
	SUPR .. "D",
	hl.dsp.exec_cmd(LAUNCHER),
	{ desc = "Application Launcher" }
)

-- Color Picker
hl.bind(
	CTL .. "F7",
	hl.dsp.exec_cmd("hyprpicker --autocopy"),
	{ desc = "Color Picker" }
)

-- Screenshots
hl.bind(
	"PRINT",
	hl.dsp.exec_cmd "grimblast copysave area ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png",
	{ desc = "Take a Screenshot of the area" }
)
hl.bind(
	CTL .. "PRINT",
	hl.dsp.exec_cmd "grimblast copysave active ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png",
	{ desc = "Take a Screenshot of the active window" }
)
hl.bind(
	ALT .. "print",
	hl.dsp.exec_cmd "grimblast copysave output ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png",
	{ desc = "Take a Screenshot of the active Monitor" }
)

hl.bind(
	SUPR .. SHFT .. "B",
	hl.dsp.exec_cmd "pkill quickshell && quickshell &",
	{ desc = "Restart Quickshell" }
)
-- Wlogout
hl.bind(
	SUPR .. "P",
	hl.dsp.exec_cmd "wlogout -b 5 -T 400 -B 400 -L 300 -R 300",
	{ desc = "Power Menu" }
)
