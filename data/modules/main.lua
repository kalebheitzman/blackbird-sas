-- welcome
sasl.logInfo("Loading SR71 Autopilot by @Bluegrass...")

-- basics
sasl.options.setAircraftPanelRendering(false)
sasl.options.set3DRendering(false)
sasl.options.setInteractivity(true)

local calloutWindow = contextWindow {
    name = "Callouts",
    position = {10, 10, 355, 125},
    noResize = true,
    visible = true,
    vrAuto = true,
    noDecore = true,
    noMove = true,
    noBackground = true,
    components = {callouts {
        position = {10, 10, 355, 125}
    }}
}

local apWindow = contextWindow {
    name = "SAS",
    position = {10, 50, 355, 125},
    noResize = true,
    visible = true,
    vrAuto = true,
    noDecore = true,
    noMove = true,
    noBackground = true,
    components = {autopilot {
        position = {0, 0, 355, 125}
    }}
}

local radioWindow = contextWindow {
    name = "Radio",
    position = {10, 165, 290, 120},
    noResize = true,
    visible = true,
    vrAuto = true,
    noDecore = true,
    noMove = true,
    noBackground = true,
    components = {radio {
        position = {10, 10, 290, 120}
    }}
}

-- local cameraWindow = contextWindow {
--     name = "Camera",
--     position = {10, 145, 355, 260},
--     noResize = true,
--     visible = true,
--     vrAuto = true,
--     noDecore = true,
--     noMove = true,
--     noBackground = true,
--     components = {camera {
--         position = {0, 0, 355, 260}
--     }}
-- }
