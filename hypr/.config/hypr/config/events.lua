-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
-- AutoStart
hl.on("hyprland.start", function()
	hl.exec_cmd "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
	hl.exec_cmd "uwsm app -s b -- nm-applet --indicator"
	hl.exec_cmd "quickshell"
	hl.exec_cmd "mako"
	hl.exec_cmd "hyprpaper"
end)
hl.on("config.reloaded", function ()
	Colors.update_colors()
end)
