include("./styles.lua")
include("./commands.lua")
include("./datarefs.lua")
include("./params")
include("./camera.lua")
include("./functions.lua")

-- functions
include("./interaction.lua")
include("./schedule.lua")

-- positions
ap_pos = {10, 65, 50, 50}
stab_pitch_pos = {65, 65, 50, 50}
stab_roll_pos = {120, 65, 50, 50}
stab_yaw_pos = {175, 65, 50, 50}

hold_mach_pos = {10, 10, 50, 50}
hold_keas_pos = {65, 10, 50, 50}
hold_nav_pos = {120, 10, 50, 50}
hold_hdg_pos = {175, 10, 50, 50}

trim_pitch_pos = {230, 65, 50, 50}
trim_roll_pos = {230, 10, 50, 50}

mode_nav_pos = {285, 10, 60, 195}

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
}, trim_roll {
    position = trim_roll_pos
}, mode_nav {
    position = mode_nav_pos
}}

function draw()
    drawAll(ap_components)

    -- sr71 airspeed schedule for mach and keas hold
    -- airspeed_schedule()

    -- ap csc button
    -- renable stick when ap is off
    -- use csc during ap to use stick
    servos_on_ref = get(servos_on)
    if servos_on_ref == 0 then
        set(override_joystick, 0)
    end

    gps_hdef_dots_pilot_ref = math.abs(get(gps_hdef_dots_pilot))
    gps_dme_distance_nm_ref = get(gps_dme_distance_nm)

    heading_is_gpss_ref = get(heading_is_gpss)
    heading_electric_deg_mag_pilot_ref = get(heading_electric_deg_mag_pilot)
    gps_bearing_deg_mag_ref = get(gps_bearing_deg_mag)
    mach_ref = get(airspeed_mach)

    -- set(override_flightdir_roll, 0)
    -- set(override_autopilot, 1)
    -- set(flight_director_roll, 60)
    set(bank_angles_values, 1, 1)
    set(bank_angles_values, 5, 2)
    set(bank_angles_values, 30, 5)
    set(bank_angles_values, 45, 6)

    deg_diff = math.abs(heading_electric_deg_mag_pilot_ref - gps_bearing_deg_mag_ref)

    -- if mach_ref > 2.6 and heading_is_gpss_ref == 1 and gps_dme_distance_nm_ref > 40 then
    --     sasl.logInfo("hdef", gps_hdef_dots_pilot_ref)
    --     sasl.logInfo(get(bank_angle_mode))
    --     sasl.logInfo(deg_diff)

    --     if gps_hdef_dots_pilot_ref < 0.5 and deg_diff < 10 then
    --         set(bank_angle_mode, 1)
    --     elseif gps_hdef_dots_pilot_ref < 1 and deg_diff < 10 then
    --         set(bank_angle_mode, 2)
    --     elseif gps_hdef_dots_pilot_ref < 2 then
    --         set(bank_angle_mode, 4)
    --     else
    --         -- set(bank_angle_mode, 6)
    --     end
    -- else
    --     set(bank_angle_mode, 6)
    -- end
    -- set(bank_angle_mode, 6)

    -- firstNavAid = sasl.getFirstNavAid()
    -- nextNavAid = sasl.getNextNavAid(firstNavAid)
    -- lastNavAid = sasl.getNextNavAid(nextNavAid)

    -- entry = sasl.getDisplayedFMSEntry()

    -- type1, lat1, lon1 = sasl.getNavAidInfo(firstNavAid)
    -- type2, lat2, lon2 = sasl.getNavAidInfo(nextNavAid)
    -- type3, lat3, lon3 = sasl.getNavAidInfo(lastNavAid)

    -- id = sasl.getGPSDestination()

    -- sasl.logInfo(id, entry, lat1, lon1, lat2, lon2, lat3, lon3)

end
