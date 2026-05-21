local home = os.getenv "HOME"
hl.bind(
	SUPR .. ALT .. "K",
	hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/shortcut_picker")
)
