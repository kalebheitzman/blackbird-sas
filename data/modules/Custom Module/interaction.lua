include("./styles.lua")

function onMouseDown(component, x, y, button, parentX, parentY)

    -- ap button
    if (button == MB_LEFT) and x >= ap_pos[1] and x <= (ap_pos[1] + 50) and y >= ap_pos[2] and y <= (ap_pos[2] + 50) then

        fd_mode_ref = get(fd_mode)
        if fd_mode_ref == 2 then
            set(fd_mode, 0)
        else
            set(fd_mode, 2)
        end
    end

    -- stab_pitch button
    if (button == MB_LEFT) and x >= stab_pitch_pos[1] and x <= (stab_pitch_pos[1] + 50) and y >= stab_pitch_pos[2] and y <=
        (stab_pitch_pos[2] + 50) then
        pitch_stab_on_ref = get(pitch_stab_on)
        if pitch_stab_on_ref == 1 then
            set(pitch_stab_on, 0)
        else
            set(pitch_stab_on, 1)
        end

    end

    -- stab_roll button
    if (button == MB_LEFT) and x >= stab_roll_pos[1] and x <= (stab_roll_pos[1] + 50) and y >= stab_roll_pos[2] and y <=
        (stab_roll_pos[2] + 50) then
        roll_stab_on_ref = get(roll_stab_on)
        if roll_stab_on_ref == 1 then
            set(roll_stab_on, 0)
        else
            set(roll_stab_on, 1)
        end

    end

    -- stab_yaw button
    if (button == MB_LEFT) and x >= stab_yaw_pos[1] and x <= (stab_yaw_pos[1] + 50) and y >= stab_yaw_pos[2] and y <=
        (stab_yaw_pos[2] + 50) then
        yaw_stab_on_ref = get(yaw_stab_on)
        if yaw_stab_on_ref == 1 then
            set(yaw_stab_on, 0)
        else
            set(yaw_stab_on, 1)
        end

    end

    -- hold_mach button
    if (button == MB_LEFT) and x >= hold_mach_pos[1] and x <= (hold_mach_pos[1] + 50) and y >= hold_mach_pos[2] and y <=
        (hold_mach_pos[2] + 50) then

        altitude_mode_ref = get(altitude_mode)
        airspeed_is_mach_ref = get(airspeed_is_mach)
        schedule_on_ref = get(schedule_on)

        if airspeed_is_mach_ref == 0 and altitude_mode_ref == 5 then
            set(airspeed_is_mach, 1)
        elseif airspeed_is_mach_ref == 1 and altitude_mode_ref == 5 then
            set(airspeed_is_mach, 0)
            set(altitude_mode, 0)
        else
            set(airspeed_is_mach, 1)
            set(altitude_mode, 5)
        end

        airspeed_mach_ref = get(airspeed_mach)
        sasl.logInfo("current mach", airspeed_mach_ref, schedule_on_ref)
        set(airspeed_dial_kts_mach, airspeed_mach_ref)

        airspeed_kts_ref = get(airspeed_kts)
        set(airspeed_mach_const, airspeed_mach_ref)
        set(schedule_on, 0)

    end

    -- hold_keas button
    if (button == MB_LEFT) and x >= hold_keas_pos[1] and x <= (hold_keas_pos[1] + 50) and y >= hold_keas_pos[2] and y <=
        (hold_keas_pos[2] + 50) then

        altitude_mode_ref = get(altitude_mode)
        airspeed_is_mach_ref = get(airspeed_is_mach)

        if airspeed_is_mach_ref == 1 and altitude_mode_ref == 5 then
            set(airspeed_is_mach, 0)
        elseif airspeed_is_mach_ref == 0 and altitude_mode_ref == 5 then
            set(airspeed_is_mach, 0)
            set(altitude_mode, 0)
        else
            set(airspeed_is_mach, 0)
            set(altitude_mode, 5)
        end

        airspeed_kts_ref = get(airspeed_kts)
        set(airspeed_kts_const, airspeed_kts_ref)
        set(airspeed_dial_kts_mach, airspeed_kts_ref)
        set(schedule_on, 0)

    end

    -- hold_nav button
    if (button == MB_LEFT) and x >= hold_nav_pos[1] and x <= (hold_nav_pos[1] + 50) and y >= hold_nav_pos[2] and y <=
        (hold_nav_pos[2] + 50) then
        heading_mode_ref = get(heading_mode)
        if heading_mode_ref == 1 then
            set(heading_mode, 12)
            set(heading_is_gpss, 0)
        else
            set(heading_mode, 1)
            set(heading_is_gpss, 1)
        end

    end

    -- hold_hdg button
    if (button == MB_LEFT) and x >= hold_hdg_pos[1] and x <= (hold_hdg_pos[1] + 50) and y >= hold_hdg_pos[2] and y <=
        (hold_hdg_pos[2] + 50) then
        heading_mode_ref = get(heading_mode)

        if heading_mode_ref == 1 then
            set(heading_mode, 12)
        else
            set(heading_is_gpss, 0)
            set(heading_mode, 1)
        end
    end

    -- mode_nav ins button
    if (button == MB_LEFT) and x >= mode_nav_pos[1] and x <= (mode_nav_pos[1] + 50) and y >= (mode_nav_pos[2] + 93) and
        y <= (mode_nav_pos[2] + 93 + 37) then

        heading_is_gpss_ref = get(heading_is_gpss)

        if heading_is_gpss_ref == 1 then
            set(heading_is_gpss, 0)
            set(heading_mode, 12)
        else
            set(heading_is_gpss, 1)
            set(heading_mode, 1)
        end

    end

    -- mode_nav tacan button
    if (button == MB_LEFT) and x >= mode_nav_pos[1] and x <= (mode_nav_pos[1] + 50) and y >= (mode_nav_pos[2] + 46) and
        y <= (mode_nav_pos[2] + 46 + 37) then

        heading_is_gpss_ref = get(heading_is_gpss)
        heading_mode_ref = get(heading_mode)

        set(heading_is_gpss, 0)

        if heading_mode_ref == 2 then
            set(heading_mode, 12)
        else
            set(heading_mode, 2)
        end
    end

    -- mode_nav ils button
    if (button == MB_LEFT) and x >= mode_nav_pos[1] and x <= (mode_nav_pos[1] + 50) and y >= (mode_nav_pos[2]) and y <=
        (mode_nav_pos[2] + 37) then

    end

    -- trim_pitch button
    if (button == MB_LEFT) and x >= trim_pitch_pos[1] and x <= (trim_pitch_pos[1] + 50) and y >= trim_pitch_pos[2] and y <=
        (trim_pitch_pos[2] + 50) then
        altitude_mode_ref = get(altitude_mode)
        pitch_electric_deg_pilot_ref = get(pitch_electric_deg_pilot)

        if altitude_mode_ref ~= 3 then
            set(sync_hold_pitch_deg, pitch_electric_deg_pilot_ref)
            set(altitude_mode, 3)
        else
            set(altitude_mode, 12)
        end

    end

    -- trim_roll button
    if (button == MB_LEFT) and x >= trim_roll_pos[1] and x <= (trim_roll_pos[1] + 50) and y >= trim_roll_pos[2] and y <=
        (trim_roll_pos[2] + 50) then
        heading_mode_ref = get(heading_mode)
        if heading_mode_ref ~= 0 then
            set(heading_mode, 0)
        else
            set(heading_mode, 12)
        end

    end

    return false
end

function onMouseHold(component, x, y, button, parentX, parentY)

    pitch_tune = 1 / 60
    roll_tune = 1 / 20

    -- wheel_pitch up button
    if (button == MB_LEFT) and x >= wheel_pitch_pos[1] and x <= (wheel_pitch_pos[1] + 50) and y >=
        (wheel_pitch_pos[2] + 27.5) and y <= (wheel_pitch_pos[2] + 50) then

        sync_hold_pitch_deg_ref = get(sync_hold_pitch_deg)
        pitch_min = -2.5
        pitch_adj = sync_hold_pitch_deg_ref - pitch_tune
        if pitch_adj < pitch_min then
            pitch_adj = pitch_min
        end

        set(sync_hold_pitch_deg, pitch_adj)
        set(hover_pitch_down_color, green)
    end

    -- wheel_pitch down button
    if (button == MB_LEFT) and x >= wheel_pitch_pos[1] and x <= (wheel_pitch_pos[1] + 50) and y >= (wheel_pitch_pos[2]) and
        y <= (wheel_pitch_pos[2] + 22.5) then

        sync_hold_pitch_deg_ref = get(sync_hold_pitch_deg)
        pitch_max = 6.55
        pitch_adj = sync_hold_pitch_deg_ref + pitch_tune
        if (pitch_adj > pitch_max) then
            pitch_adj = pitch_max
        end

        set(sync_hold_pitch_deg, pitch_adj)
        set(hover_pitch_up_color, green)
    end

    -- wheel_roll button
    if (button == MB_LEFT) and x >= wheel_roll_pos[1] and x <= (wheel_roll_pos[1] + 22.5) and y >= wheel_roll_pos[2] and
        y <= (wheel_roll_pos[2] + 50) then

        sync_hold_roll_deg_ref = get(sync_hold_roll_deg)
        roll_min = -30 -- 50 in HDG mode, 45 in ANS mode
        roll_adj = sync_hold_roll_deg_ref - roll_tune
        if roll_adj < roll_min then
            roll_adj = roll_min
        end
        set(sync_hold_roll_deg, roll_adj)
        set(hover_roll_left_color, green)
    end

    -- wheel_roll button
    if (button == MB_LEFT) and x >= (wheel_roll_pos[1] + 27.5) and x <= (wheel_roll_pos[1] + 50) and y >=
        wheel_roll_pos[2] and y <= (wheel_roll_pos[2] + 50) then

        sync_hold_roll_deg_ref = get(sync_hold_roll_deg)
        roll_max = 30 -- 50 in HDG mode, 45 in ANS mode
        roll_adj = sync_hold_roll_deg_ref + roll_tune
        if roll_adj > roll_max then
            roll_adj = roll_max
        end
        set(sync_hold_roll_deg, roll_adj)
        set(hover_roll_right_color, green)
    end

end

function onMouseUp(component, x, y, button, parentX, parentY)

    -- wheel_pitch up button
    if (button == MB_LEFT) and x >= wheel_pitch_pos[1] and x <= (wheel_pitch_pos[1] + 50) and y >=
        (wheel_pitch_pos[2] + 27.5) and y <= (wheel_pitch_pos[2] + 50) then

        set(hover_pitch_down_color, white)
    end

    -- wheel_pitch down button
    if (button == MB_LEFT) and x >= wheel_pitch_pos[1] and x <= (wheel_pitch_pos[1] + 50) and y >= (wheel_pitch_pos[2]) and
        y <= (wheel_pitch_pos[2] + 22.5) then

        set(hover_pitch_up_color, white)
    end

    -- wheel_roll button
    if (button == MB_LEFT) and x >= wheel_roll_pos[1] and x <= (wheel_roll_pos[1] + 22.5) and y >= wheel_roll_pos[2] and
        y <= (wheel_roll_pos[2] + 50) then

        set(hover_roll_left_color, white)
    end

    -- wheel_roll button
    if (button == MB_LEFT) and x >= (wheel_roll_pos[1] + 27.5) and x <= (wheel_roll_pos[1] + 50) and y >=
        wheel_roll_pos[2] and y <= (wheel_roll_pos[2] + 50) then

        set(hover_roll_right_color, white)
    end

end

function onMouseWheel(component, x, y, button, parentX, parentY, value)

    set(hover_pitch_down_color, white)
    set(hover_pitch_up_color, white)
    set(hover_roll_left_color, white)
    set(hover_roll_right_color, white)

    -- hold_mach button
    if x >= hold_mach_pos[1] and x <= (hold_mach_pos[1] + 50) and y >= (hold_mach_pos[2]) and y <=
        (hold_mach_pos[2] + 50) then

        airspeed_is_mach_ref = get(airspeed_is_mach)
        airspeed_mach_const_ref = get(airspeed_mach_const)
        airspeed_mach_tune = 1 / 100
        airspeed_mach_adj = airspeed_mach_const_ref + (airspeed_mach_tune * value)

        mach_min = 2.6
        mach_max = 3.3

        sasl.logInfo(airspeed_mach_adj)

        if airspeed_mach_adj < mach_min then
            airspeed_mach_adj = mach_min
        elseif airspeed_mach_adj > mach_max then
            airspeed_mach_adj = mach_max
        end

        if airspeed_is_mach_ref == 1 then
            set(airspeed_mach_const, airspeed_mach_adj)
            set(airspeed_dial_kts_mach, airspeed_mach_adj)
        end
    end

    -- hold_keas button
    if x >= hold_keas_pos[1] and x <= (hold_keas_pos[1] + 50) and y >= (hold_keas_pos[2]) and y <=
        (hold_keas_pos[2] + 50) then

        airspeed_is_mach_ref = get(airspeed_is_mach)
        airspeed_kts_const_ref = get(airspeed_kts_const)
        airspeed_kts_tune = 1 / 100
        airspeed_kts_adj = airspeed_kts_const_ref + (airspeed_kts_tune * value)

        kts_min = 2.6
        kts_max = 3.3

        sasl.logInfo(airspeed_kts_adj)

        if airspeed_kts_adj < kts_min then
            airspeed_kts_adj = kts_min
        elseif airspeed_kts_adj > kts_max then
            airspeed_kts_adj = kts_max
        end

        if airspeed_is_mach_ref == 0 then
            set(airspeed_kts_const, airspeed_kts_adj)
            set(airspeed_dial_kts_mach, airspeed_kts_adj)
        end
    end

    -- wheel_pitch up button
    if x >= trim_pitch_pos[1] and x <= (trim_pitch_pos[1] + 50) and y >= (trim_pitch_pos[2]) and y <=
        (trim_pitch_pos[2] + 50) then
        sync_hold_pitch_deg_ref = get(sync_hold_pitch_deg)
        pitch_tune = 1 / 60
        pitch_min = -2.5
        pitch_adj = sync_hold_pitch_deg_ref + (pitch_tune * value)
        if pitch_adj < pitch_min then
            pitch_adj = pitch_min
        end

        set(sync_hold_pitch_deg, pitch_adj)
        if value > 0 then
            set(hover_pitch_down_color, green)
        else
            set(hover_pitch_up_color, green)
        end
    end

    -- wheel_roll button
    if x >= trim_roll_pos[1] and x <= (trim_roll_pos[1] + 50) and y >= trim_roll_pos[2] and y <= (trim_roll_pos[2] + 50) then

        sync_hold_roll_deg_ref = get(sync_hold_roll_deg)
        roll_tune = 1 / 20
        roll_min = -30 -- 50 in HDG mode, 45 in ANS mode
        roll_adj = sync_hold_roll_deg_ref + (roll_tune * value)
        if roll_adj < roll_min then
            roll_adj = roll_min
        end
        set(sync_hold_roll_deg, roll_adj)
        if value > 0 then
            set(hover_roll_right_color, green)
        else
            set(hover_roll_left_color, green)
        end
    end

end

function onMouseMove()
    set(hover_pitch_down_color, white)
    set(hover_pitch_up_color, white)
    set(hover_roll_left_color, white)
    set(hover_roll_right_color, white)

end
