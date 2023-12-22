-- welcome
sasl.logInfo("Loading SR71 Autopilot by @Bluegrass...")

-- basics
sasl.options.setAircraftPanelRendering(false)
sasl.options.set3DRendering(false)
sasl.options.setInteractivity(true)

local apWindow = contextWindow {
    name = "SR71 Autopilot",
    position = {10, 10, 355, 125},
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

