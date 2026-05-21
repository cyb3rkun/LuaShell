-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful
-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Apply uniform layout properties to the launcher namespace
hl.layer_rule({
    match        = { namespace = "hyprlauncher" },
    blur         = true,
    ignore_alpha = 0.3,  -- Lower than 0.4 so your transparent space gets blurred cleanly
    xray         = true,  -- Pierces directly down to the wallpaper vector canvas
})
