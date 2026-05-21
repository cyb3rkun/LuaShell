local home = os.getenv "HOME"
hl.bind(
	SUPR .. ALT .. "K",
	hl.dsp.exec_cmd(
		home .. "/.config/hypr/scripts/shortcut_picker"
	),
		{ desc = "I think You figured this one out :) (Shortcut Picker)" }
)
