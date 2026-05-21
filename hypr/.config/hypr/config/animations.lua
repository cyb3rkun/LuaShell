-- Curves
hl.curve("floatIn",    { type = "bezier", points = { {0.0, 0.0}, {0.2, 1.0} } })  -- slow start, fast finish
hl.curve("floatOut",   { type = "bezier", points = { {0.4, 0.0}, {1.0, 1.0} } })  -- fast start, slow finish (drift away)
hl.curve("linear",     { type = "bezier", points = { {0.0, 0.0}, {1.0, 1.0} } })
hl.curve("quick",      { type = "bezier", points = { {0.15, 0},  {0.1, 1}   } })

-- Low gravity spring: low stiffness, low damping = floaty with gentle overshoot
hl.curve("moonSpring", { type = "spring", mass = 1, stiffness = 38, dampening = 8.5 })

-- Windows
hl.animation({ leaf = "windows",    enabled = true, speed = 3.5,  spring = "moonSpring" })
hl.animation({ leaf = "windowsIn",  enabled = true, speed = 3.8,  spring = "moonSpring", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.8,  bezier = "floatOut",   style = "popin 80%" })

-- Fades
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 2.2,  bezier = "floatIn" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 2.0,  bezier = "floatOut" })
hl.animation({ leaf = "fade",          enabled = true, speed = 2.5,  bezier = "floatIn" })

-- Layers (bar, popups)
hl.animation({ leaf = "layers",        enabled = true, speed = 3.2,  bezier = "floatIn" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 3.5,  bezier = "floatIn",  style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 2.0,  bezier = "floatOut", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 2.0,  bezier = "floatIn" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.8,  bezier = "floatOut" })

-- Workspaces — slow drift like floating between spaces
hl.animation({ leaf = "workspaces",    enabled = true, speed = 2.8,  bezier = "floatOut", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 3.0,  bezier = "floatIn",  style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.5,  bezier = "floatOut", style = "slide" })

-- Border
hl.animation({ leaf = "border",     enabled = true, speed = 4.0,  bezier = "floatIn" })

-- Global
hl.animation({ leaf = "global",     enabled = true, speed = 10,   bezier = "default" })

-- Zoom
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 5.0,  bezier = "floatOut" })
