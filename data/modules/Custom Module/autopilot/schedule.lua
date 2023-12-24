function airspeed_schedule()

    -- altitude_mode
    altitude_mode_ref = get(altitude_mode)
    schedule_on_ref = get(schedule_on)

    if altitude_mode_ref == 5 then

        airspeed_kts_const_ref = get(airspeed_kts_const)
        airspeed_mach_const_ref = get(airspeed_mach_const)
        airspeed_is_mach_ref = get(airspeed_is_mach)
        airspeed_kts_ref = get(airspeed_kts)
        altitude_ref = get(alititude)
        mach_ref = get(airspeed_mach)

        -- bleed refs
        -- 500 KEAS and Mach 2.1
        -- 380 KEAS and Mach 3.3
        -- bleed line is a linear function of 10 kts per 0.1 Mach number
        mach_min = 2.1
        mach_max = 3.3
        kts_min = 380
        kts_max = 500

        -- bleed table
        bleed_table = {}
        bleed_table[380] = 3.3
        bleed_table[390] = 3.2
        bleed_table[400] = 3.1
        bleed_table[410] = 3.0
        bleed_table[420] = 2.9
        bleed_table[430] = 2.8
        bleed_table[440] = 2.7
        bleed_table[450] = 2.6
        bleed_table[460] = 2.5
        bleed_table[470] = 2.4
        bleed_table[480] = 2.3
        bleed_table[490] = 2.2
        bleed_table[500] = 2.1

        -- get the schedule
        schedule_kts = math.floor(airspeed_kts_ref / 10) * 10
        if schedule_kts < kts_min then
            schedule_kts = kts_min
        elseif schedule_kts > kts_max then
            schedule_kts = kts_max
        end
        bleed_mach = bleed_table[schedule_kts]

        -- turn the schedule on when needed

        if airspeed_is_mach_ref == 1 and bleed_mach > airspeed_mach_const_ref then
            set(schedule_on, 0)
        elseif mach_ref > bleed_mach and airspeed_kts_ref > schedule_kts and schedule_on_ref == 0 then
            set(schedule_on, 1)
        end

        mach_diff = mach_ref - bleed_mach
        kts_diff = airspeed_kts_ref - (mach_diff * 10)

        -- sasl.logInfo("schedule", schedule_on_ref, schedule_kts, kts_diff, airspeed_kts_ref, bleed_mach, mach_ref,
        --     mach_diff)

        -- schedule is on, update the KEAS/MACH hold
        if schedule_on_ref == 1 then
            if schedule_kts >= kts_max then
                schedule_speed = kts_max
            elseif schedule_kts <= kts_min then
                schedule_speed = kts_min
            else
                schedule_speed = kts_diff
            end
            set(airspeed_dial_kts, schedule_speed)
            -- if airspeed_is_mach_ref == 1 then
            --     set(airspeed_dial_kts_mach, airspeed_mach_const_ref)
            -- else
            --     set(airspeed_dial_kts, schedule_speed)
            -- end

        else
            if airspeed_is_mach_ref == 1 then
                set(airspeed_dial_kts_mach, airspeed_mach_const_ref)
            else
                set(airspeed_dial_kts_mach, airspeed_kts_const_ref)
            end
        end

    end

end
