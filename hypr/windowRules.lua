
--reglas todas malas 

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "Ubicación",
    match = { title = "Ubicación" },

    float = true,
    size = {800,600}
})

hl.window_rule({
    name = "Preferencias",
    match = { title = "^Preferencias/" },

    float = true,
    size = {800, 600}
})

hl.window_rule({
    name = "Monitor_de_recursos",
    match = { title = "^Monitor de recursos$" },

    float = true,
    size = {1000, 600},
    border_size = 5
})

hl.window_rule({
    name = "Bluetooth Manager",
    match = { title = "^Bluetooth Manager$" },

    float = true,
    pin = true,
    -- ancho, alto
    size = {600,400},
    move = {"window_w * 1.24", "(monitor_h / 22)"},
    border_size = 5
})

hl.window_rule({
    name = "WI-FI manager",
    match = { title = "^WI-FI manager$" },

    float = true,
    pin = true,
    size = {600,400},
    move = {"window_w * 1.24", "(monitor_h / 22)"},
    border_size = 5
})

hl.window_rule({
    name = "Controlador de volumen",
    match = { title = "^Control de volumen$" },

    float = true,
    pin = true,
    size = {600,400},
    move = {"window_w * 1.24", "(monitor_h / 22)"},
    border_size = 5
})

hl.window_rule({
    name = "lista de amigos",
    match = {title = "^Friends List$"},

    float = true,
    size = {300,850},
    move = {"window_w * 0.04", "(monitor_h / 22)"},
})