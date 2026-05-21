hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_CURSOR_SIZE", "24")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
-- use qt5ct for compatibility. make sure both qt6ct and qt5ct and
-- qt5-wayland, qt6-wayland and finally qt6-5compat are installed
hl.env("QT_QPA_PLATFRORMTHEME", "qt6ct")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("GDK_SCALE", "1")
hl.env("EDITOR", "nvim")
hl.env("LANG", "en_US.UTF-8")
hl.env("LC_CTYPE", "ja_JP.UTF-8")
hl.env("LC_ALL", "en_US.UTF-8")
hl.env("TERM", "wezterm")

hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.on(
	"hyprland.start",
	function()
		hl.exec_cmd "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
	end
)
