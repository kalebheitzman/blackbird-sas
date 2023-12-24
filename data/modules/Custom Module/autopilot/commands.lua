function csc_pushbutton_handler(phase)

    -- ap state
    servos_on_ref = get(servos_on)
    override_joystick_ref = get(override_joystick)

    -- pitch and roll state
    altitude_mode_state_ref = get(altitude_mode_state)
    heading_mode_state_ref = get(heading_mode_state)
    heading_is_gpss_state_ref = get(heading_is_gpss_state)
    pitch_electric_deg_pilot_ref = get(pitch_electric_deg_pilot)
    roll_electric_deg_pilot_ref = get(roll_electric_deg_pilot)

    if servos_on_ref == 1 and phase == 1 then
        set(override_joystick, 0)

        -- disengage pitch and roll mode
        set(altitude_mode, 12)
        set(heading_mode, 12)

    elseif servos_on_ref == 1 and phase == 2 then
        set(override_joystick, 1)

        -- set sync params
        set(sync_hold_pitch_deg, pitch_electric_deg_pilot_ref)
        set(sync_hold_roll_deg, roll_electric_deg_pilot_ref)

        -- reengage pitch and roll mode
        set(altitude_mode, altitude_mode_state_ref)
        set(heading_mode, heading_mode_state_ref)
        set(heading_is_gpss, heading_is_gpss_state_ref)

    end

    return 1
end

csc_pushbutton_command = sasl.createCommand("bluegrass/sr71/commands/csc_pushbutton", "Toggle CSC Pushbutton")
sasl.registerCommandHandler(csc_pushbutton_command, 0, csc_pushbutton_handler)
