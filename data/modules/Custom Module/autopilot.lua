include("./styles.lua")
include("./datarefs")

-- functions
include("./interaction.lua")
include("./schedule.lua")

-- positions
ap_pos = {10, 65, 60, 60}
stab_pitch_pos = {65, 65, 60, 60}
stab_roll_pos = {120, 65, 60, 60}
stab_yaw_pos = {175, 65, 60, 60}

hold_mach_pos = {10, 10, 60, 60}
hold_keas_pos = {65, 10, 60, 60}
hold_nav_pos = {120, 10, 60, 60}
hold_hdg_pos = {175, 10, 60, 60}

trim_pitch_pos = {230, 65, 60, 60}
trim_roll_pos = {285, 65, 60, 60}
wheel_pitch_pos = {230, 10, 60, 60}
wheel_roll_pos = {285, 10, 60, 60}

mode_nav_pos = {270, 10, 60, 195}

-- autopilot components
ap_components = {ap {
    position = ap_pos
}, stab_pitch {
    position = stab_pitch_pos
}, stab_roll {
    position = stab_roll_pos
}, stab_yaw {
    position = stab_yaw_pos
}, hold_mach {
    position = hold_mach_pos
}, hold_keas {
    position = hold_keas_pos
}, hold_nav {
    position = hold_nav_pos
}, hold_hdg {
    position = hold_hdg_pos
}, trim_pitch {
    position = trim_pitch_pos
}, wheel_pitch {
    position = wheel_pitch_pos
}, trim_roll {
    position = trim_roll_pos
}, wheel_roll {
    position = wheel_roll_pos
} -- mode_nav {
---    position = mode_nav_pos
-- }
}

function draw()
    drawAll(ap_components)

    -- sr71 airspeed schedule for mach and keas hold
    airspeed_schedule()

    -- auto_nav_mode_fn()
end
