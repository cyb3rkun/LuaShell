-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(SUPR .. "V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(SUPR .. "F", hl.dsp.window.fullscreen({ action = "toggle" }))
-- hl.bind(SUPR .. "P", hl.dsp.window.pseudo())
hl.bind(SUPR .. SHFT .. "I", hl.dsp.layout("togglesplit")) -- dwindle only
--
-- Switch workspaces with SUPR[0-9]
-- Move active window to a workspace with SUPRSHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(SUPR .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(SUPR .. SHFT .. key, hl.dsp.window.move({ workspace = i }))
end

local directions = {
	{ "h", "left", { x = -10, y = 0 } },
	{ "j", "down", { x = 0, y = 10 } },
	{ "k", "up", { x = 0, y = -10 } },
	{ "l", "right", { x = 10, y = 0 } },
}

for _, d in ipairs(directions) do
	hl.bind(SUPR .. d[1], hl.dsp.focus({ direction = d[2] }))
	hl.bind(SUPR .. SHFT .. d[1], hl.dsp.window.move({ direction = d[2] }))
end
hl.bind(SUPR .. "R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	for _, d in ipairs(directions) do
		hl.bind(d[1], hl.dsp.window.resize({ x = d[3].x, y = d[3].y, relative = true }))
		hl.bind(ESC, hl.dsp.submap("reset"))
	end
end)
-- -- Example special workspace (scratchpad)
-- hl.bind(SUPR .. "S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(SUPR .. "SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
--
-- -- Scroll through existing workspaces with SUPRscroll
-- hl.bind(SUPR .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(SUPR .. "mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
--
-- -- Move/resize windows with SUPRLMB/RMB and dragging
hl.bind(SUPR .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(SUPR .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
--
-- -- Laptop multimedia keys for volume and LCD brightness
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
-- hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
-- hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
--
-- -- Requires playerctl
-- hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
--
