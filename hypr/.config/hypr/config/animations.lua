-- Curves
hl.curve(
	"floatIn",
	{ type = "bezier", points = { { 0.0, 0.0 }, { 1.2, 0.2 } } }
)
hl.curve(
	"floatOut",
	{ type = "bezier", points = { { 0.4, 0.0 }, { 1.0, 1.0 } } }
)
hl.curve(
	"linear",
	{ type = "bezier", points = { { 0.0, 0.0 }, { 1.0, 1.0 } } }
)
hl.curve(
	"quick",
	{ type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } }
)

-- hl.curve("linear",     { type = "bezier", points = { {0.0, 0.0}, {1.0, 1.0} } })
--
hl.curve(
	"luaSpring",
	{ type = "spring", mass = 1, stiffness = 18, dampening = 5.5 }
)
hl.curve(
	"moonJump",
	{ type = "spring", mass = 1, stiffness = 16, dampening = 5.8 }
)

-- Windows
hl.animation {
	leaf = "windows",
	enabled = true,
	speed = 3.5,
	spring = "luaSpring",
}
hl.animation {
	leaf = "windowsIn",
	enabled = true,
	speed = 3.8,
	spring = "luaSpring",
	style = "popin 10%",
}
hl.animation {
	leaf = "windowsMove",
	enabled = true,
	speed = 1.8,
	spring = "moonJump",
	style = "popin 10%",
}
hl.animation {
	leaf = "windowsOut",
	enabled = true,
	speed = 1.8,
	bezier = "floatOut",
	style = "popin 10%",
}

-- Fades
hl.animation {
	leaf = "fadeIn",
	enabled = true,
	speed = 2.2,
	bezier = "floatIn",
}
hl.animation {
	leaf = "fadeOut",
	enabled = true,
	speed = 2.0,
	bezier = "floatOut",
}
hl.animation {
	leaf = "fade",
	enabled = true,
	speed = 2.5,
	bezier = "floatIn",
}

-- Layers
hl.animation {
	leaf = "layers",
	enabled = true,
	speed = 3.2,
	bezier = "floatIn",
}
hl.animation {
	leaf = "layersIn",
	enabled = true,
	speed = 3.5,
	bezier = "floatIn",
	style = "fade",
}
hl.animation {
	leaf = "layersOut",
	enabled = true,
	speed = 2.0,
	bezier = "floatOut",
	style = "fade",
}
hl.animation {
	leaf = "fadeLayersIn",
	enabled = true,
	speed = 2.0,
	bezier = "floatIn",
}
hl.animation {
	leaf = "fadeLayersOut",
	enabled = true,
	speed = 1.8,
	bezier = "floatOut",
}

-- Workspaces
hl.curve(
	"slideIn",
	{ type = "bezier", points = { { 0.0, 0.3 }, { 0.16, 1 } } }
) -- slow start, fast finish
hl.curve(
	"SlideOut",
	{ type = "bezier", points = { { 0.4, 0.0 }, { 1.0, 1.0 } } }
) -- fast start, slow finish (drift away)
hl.curve(
	"moonLanding",
	{ type = "spring", mass = 1, stiffness = 21, dampening = 8.8 }
)
hl.curve(
	"takeOff",
	{ type = "spring", mass = 1, stiffness = 38, dampening = 10.0 }
)

hl.animation {
	leaf = "workspaces",
	enabled = true,
	speed = 1.8,
	bezier = "slideIn",
	style = "slidevert",
}
hl.animation {
	leaf = "workspacesIn",
	enabled = true,
	speed = 2.5,
	spring = "moonLanding",
	style = "slidefade",
}
hl.animation {
	leaf = "workspacesOut",
	enabled = true,
	speed = 2.5,
	spring = "takeOff",
	style = "slide",
}
hl.animation {
	leaf = "specialWorkspaceIn",
	enabled = true,
	speed = 2.5,
	spring = "moonLanding",
	style = "slidefade top",
}
hl.animation {
	leaf = "specialWorkspaceOut",
	enabled = true,
	speed = 2.5,
	spring = "takeOff",
	style = "slide",
}

-- Border
hl.animation({ leaf = "fadeShadow",     enabled = true, speed = 1.0,  bezier = "floatIn" })

-- Global
-- hl.animation({ leaf = "global",     enabled = true, speed = 10,   bezier = "default" })

-- Zoom
-- hl.animation({ leaf = "zoomFactor", enabled = true, speed = 5.0,  bezier = "floatOut" })
