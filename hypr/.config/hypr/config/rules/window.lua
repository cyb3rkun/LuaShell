local suppressMaximizeRule = hl.window_rule {
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
}
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule {
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
}


hl.window_rule {
	name = "Launchers",
	match = { class = "[Ss]team" },
	workspace = "name:Laun silent",
	render_unfocused = true,
	no_blur = true,
	no_dim = true,
	no_shadow = true,
}
-- Put Game Windows on a special workspace.
-- I've found that this avoids some issues that usually appear when
-- games lose mouse focus. by just toggling the special workspace, 
-- a lot of them can be avoided and it efectively works as ALT+TAB
hl.window_rule {
	match = { initial_class = "steam_app_\\d+" },
	content = "game",
}
hl.window_rule {
	match = {
		initial_class = "steam_app_\\d+",
		content = "game",
	},
	tag = "+game",
	workspace = "special:games",
	render_unfocused = true,
	no_blur = true,
	no_dim = true,
	no_shadow = true,
	opaque = true,
	content = "game",
	immediate = true,
	no_anim = true,
}
-- hl.window_rule {
-- 	match = {
-- 		initial_class = "^firefox"
-- 	},
-- 	opacity = 0.6
-- }
-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
-- hl.window_rule({
--     match = { focus = false },
-- 	no_shadow = true,
-- })
hl.window_rule {
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
}
