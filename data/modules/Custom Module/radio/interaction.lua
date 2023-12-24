function onMouseDown(component, x, y, button, parentX, parentY)

    -- num1 button
    if (button == MB_LEFT) and x >= pos_1[1] and x <= (pos_1[1] + 30) and y >= pos_1[2] and y <= (pos_1[2] + 30) then
        set_digit(1)
    end

    -- num2 button
    if (button == MB_LEFT) and x >= pos_2[1] and x <= (pos_2[1] + 30) and y >= pos_2[2] and y <= (pos_2[2] + 30) then
        set_digit(2)
    end

    -- num3 button
    if (button == MB_LEFT) and x >= pos_3[1] and x <= (pos_3[1] + 30) and y >= pos_3[2] and y <= (pos_3[2] + 30) then
        set_digit(3)
    end

    -- num4 button
    if (button == MB_LEFT) and x >= pos_4[1] and x <= (pos_4[1] + 30) and y >= pos_4[2] and y <= (pos_4[2] + 30) then
        set_digit(4)
    end

    -- num5 button
    if (button == MB_LEFT) and x >= pos_5[1] and x <= (pos_5[1] + 30) and y >= pos_5[2] and y <= (pos_5[2] + 30) then
        set_digit(5)
    end

    -- num6 button
    if (button == MB_LEFT) and x >= pos_6[1] and x <= (pos_6[1] + 30) and y >= pos_6[2] and y <= (pos_6[2] + 30) then
        set_digit(6)
    end

    -- num7 button
    if (button == MB_LEFT) and x >= pos_7[1] and x <= (pos_7[1] + 30) and y >= pos_7[2] and y <= (pos_7[2] + 30) then
        set_digit(7)
    end

    -- num8 button
    if (button == MB_LEFT) and x >= pos_8[1] and x <= (pos_8[1] + 30) and y >= pos_8[2] and y <= (pos_8[2] + 30) then
        set_digit(8)
    end

    -- num9 button
    if (button == MB_LEFT) and x >= pos_9[1] and x <= (pos_9[1] + 30) and y >= pos_9[2] and y <= (pos_9[2] + 30) then
        set_digit(9)
    end

    -- num0 button
    if (button == MB_LEFT) and x >= pos_0[1] and x <= (pos_0[1] + 30) and y >= pos_0[2] and y <= (pos_0[2] + 30) then
        set_digit(0)
    end

    -- x button
    if (button == MB_LEFT) and x >= pos_x[1] and x <= (pos_x[1] + 30) and y >= pos_x[2] and y <= (pos_x[2] + 30) then
        set_tac_mode(88)
    end

    -- y button
    if (button == MB_LEFT) and x >= pos_y[1] and x <= (pos_y[1] + 30) and y >= pos_y[2] and y <= (pos_y[2] + 30) then
        set_tac_mode(89)
    end

    -- tacbutton button
    if (button == MB_LEFT) and x >= pos_tacbutton[1] and x <= (pos_tacbutton[1] + 60) and y >= pos_tacbutton[2] and y <=
        (pos_tacbutton[2] + 30) then
        set(radio_mode, 0)
    end

    -- navbutton button
    if (button == MB_LEFT) and x >= pos_navbutton[1] and x <= (pos_navbutton[1] + 60) and y >= pos_navbutton[2] and y <=
        (pos_navbutton[2] + 30) then
        set(radio_mode, 1)
    end

    -- combutton button
    if (button == MB_LEFT) and x >= pos_combutton[1] and x <= (pos_combutton[1] + 60) and y >= pos_combutton[2] and y <=
        (pos_combutton[2] + 30) then
        set(radio_mode, 2)
    end

    -- switch button
    if (button == MB_LEFT) and x >= pos_sw[1] and x <= (pos_sw[1] + 30) and y >= pos_sw[2] and y <= (pos_sw[2] + 30) then

        radio_mode_ref = get(radio_mode)

        if radio_mode_ref == 0 then
            -- datarefs
            tac1_channel_ref = get(tac1_channel)
            tac1_mode_ref = get(tac1_mode)
            tac2_channel_ref = get(tac2_channel)
            tac2_mode_ref = get(tac2_mode)

            -- set tac1 channel
            set(tac1_channel, tac2_channel_ref)
            set(tac1_mode, tac2_mode_ref)

            -- set tac2 channel
            set(tac2_channel, tac1_channel_ref)
            set(tac2_mode, tac1_mode_ref)

            -- set local dataref
            set(local_tac_channel, tac1_channel_ref)
            set(local_tac_mode, tac1_mode_ref)

        elseif radio_mode_ref == 1 then
            local_nav_Mhz_ref = get(local_nav_Mhz)
            local_nav_khz_ref = get(local_nav_khz)
            nav1_frequency_Mhz_ref = get(nav1_frequency_Mhz)
            nav1_frequency_khz_ref = get(nav1_frequency_khz)

            -- set nav1 frequency
            set(nav1_frequency_Mhz, local_nav_Mhz_ref)
            set(nav1_frequency_khz, local_nav_khz_ref)

            -- set nav2 frequency
            set(nav2_frequency_Mhz, nav1_frequency_Mhz_ref)
            set(nav2_frequency_khz, nav1_frequency_khz_ref)

            -- set local frequency
            set(local_nav_Mhz, nav1_frequency_Mhz_ref)
            set(local_nav_khz, nav1_frequency_khz_ref)

        elseif radio_mode_ref == 2 then
            local_com_Mhz_ref = get(local_com_Mhz)
            local_com_khz_ref = get(local_com_khz)
            com1_frequency_Mhz_ref = get(com1_frequency_Mhz)
            com1_frequency_khz_ref = get(com1_frequency_khz)

            if getNumberLength(local_com_khz_ref) == 1 then
                local_com_khz_ref = local_com_khz_ref .. "00"
            elseif getNumberLength(local_com_khz_ref) == 2 then
                local_com_khz_ref = local_com_khz_ref .. "0"
            end

            -- set com1 frequency
            set(com1_frequency_Mhz, local_com_Mhz_ref)
            set(com1_frequency_khz, local_com_khz_ref)

            -- set com2 frequency
            set(com2_frequency_Mhz, com1_frequency_Mhz_ref)
            set(com2_frequency_khz, com1_frequency_khz_ref)

            -- set local frequency
            set(local_com_Mhz, com1_frequency_Mhz_ref)
            set(local_com_khz, com1_frequency_khz_ref)

        end

    end

    return false
end

function set_digit(digit)
    radio_mode_ref = get(radio_mode)
    if radio_mode_ref == 0 then
        set_tac_channel(digit)
    elseif radio_mode_ref == 1 then
        set_nav_digit(digit)
    elseif radio_mode_ref == 2 then
        set_com_digit(digit)
    end
end

function set_tac_channel(digit)
    channel_ref = get(local_tac_channel)
    mode_ref = get(local_tac_mode)

    if channel_ref == 0 then
        channel = digit
    elseif mode_ref ~= 0 then
        channel = digit
    else
        channel = channel_ref .. digit
    end

    if tonumber(channel) > 126 then
        channel = 0
    end

    set(local_tac_channel, channel)
    set(local_tac_mode, 0)
end

function set_tac_mode(mode)
    channel_ref = get(local_tac_channel)

    set(local_tac_mode, mode)

    if channel_ref ~= 0 then
        set(tac2_channel, channel_ref)
        set(tac2_mode, mode)
    end
end

function set_nav_digit(digit)
    local_nav_Mhz_ref = get(local_nav_Mhz)
    local_nav_khz_ref = get(local_nav_khz)
    init_nav_entry_ref = get(init_nav_entry)

    min_Mhz = 108
    max_Mhz = 118

    if init_nav_entry_ref == 1 then
        set(local_nav_Mhz, digit)
        set(local_nav_khz, "--")
        set(init_nav_entry, 0)
    else
        Mhz_length = getNumberLength(local_nav_Mhz_ref)
        khz_length = getNumberLength(local_nav_khz_ref)

        if Mhz_length < 3 then
            set(local_nav_Mhz, local_nav_Mhz_ref .. digit)

        elseif Mhz_length == 3 and local_nav_khz_ref == "--" then
            if tonumber(local_nav_Mhz_ref) > max_Mhz or tonumber(local_nav_Mhz_ref) < min_Mhz then
                sasl.logInfo(local_nav_Mhz_ref)
                set(local_nav_Mhz, "--")
                set(init_nav_entry, 1)
            else
                set(local_nav_khz, digit)
            end

        elseif Mhz_length == 3 and khz_length < 2 then
            set(local_nav_khz, local_nav_khz_ref .. digit)

        else
            -- sasl.logInfo("reset nav radio")
            set(init_nav_entry, 1)
            set(local_nav_Mhz, "--")
            set(local_nav_khz, "--")
        end

    end
end

function set_com_digit(digit)
    local_com_Mhz_ref = get(local_com_Mhz)
    local_com_khz_ref = get(local_com_khz)
    init_com_entry_ref = get(init_com_entry)

    min_Mhz = 118
    max_Mhz = 136
    max_khz = 995

    if init_com_entry_ref == 1 then
        set(local_com_Mhz, digit)
        set(local_com_khz, "--")
        set(init_com_entry, 0)
    else
        Mhz_length = getNumberLength(local_com_Mhz_ref)
        khz_length = getNumberLength(local_com_khz_ref)

        if Mhz_length < 3 then
            set(local_com_Mhz, local_com_Mhz_ref .. digit)

        elseif Mhz_length == 3 and local_com_khz_ref == "--" then
            if tonumber(local_com_Mhz_ref) > max_Mhz or tonumber(local_com_Mhz_ref) < min_Mhz then
                sasl.logInfo(local_com_Mhz_ref)
                set(local_com_Mhz, "--")
                set(init_com_entry, 1)
            else
                set(local_com_khz, digit)
            end

        elseif Mhz_length == 3 and khz_length < 3 then
            khz_freq = tonumber(local_com_khz_ref .. digit)
            khz_freq_length = getNumberLength(khz_freq)

            if khz_freq > max_khz then -- account for Mhz???
                set(init_com_entry, 1)
                set(local_com_Mhz, "--")
                set(local_com_khz, "--")
            else
                set(local_com_khz, local_com_khz_ref .. digit)
            end

        else
            -- sasl.logInfo("reset com radio")
            set(init_com_entry, 1)
            set(local_com_Mhz, "--")
            set(local_com_khz, "--")
        end

    end

end

function getNumberLength(number)
    local strNumber = tostring(number)
    return #strNumber
end
