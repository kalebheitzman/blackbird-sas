include("../styles.lua")

function draw()

    sasl.gl.drawRectangle(0, 0, 83, 30, button)

    radio_mode_ref = get(radio_mode)
    if radio_mode_ref == 0 then
        tac_channel_ref = get(tac1_channel)
        tac_mode_ref = get(tac1_mode)

        mode = "--"
        if tac_mode_ref == 88 then
            mode = "X"
        elseif tac_mode_ref == 89 then
            mode = "Y"
        end

        channel = "--"
        if tac_channel_ref ~= 0 then
            channel = tac_channel_ref
        end

        color = green
        if channel == "--" then
            color = white
        end

        sasl.gl.drawText(roboto, 65, 10, channel, 12, true, false, TEXT_ALIGN_RIGHT, color)
        sasl.gl.drawText(roboto, 66, 10, mode, 12, true, false, TEXT_ALIGN_LEFT, color)

    elseif radio_mode_ref == 1 then
        nav1_frequency_Mhz_ref = get(nav1_frequency_Mhz)
        nav1_frequency_khz_ref = get(nav1_frequency_khz)

        sasl.gl.drawText(roboto, 71, 10, nav1_frequency_Mhz_ref .. "." .. nav1_frequency_khz_ref, 12, true, false,
            TEXT_ALIGN_RIGHT, green)
    elseif radio_mode_ref == 2 then
        com1_frequency_Mhz_ref = get(com1_frequency_Mhz)
        com1_frequency_khz_ref = get(com1_frequency_khz)

        sasl.gl.drawText(roboto, 71, 10, com1_frequency_Mhz_ref .. "." .. com1_frequency_khz_ref, 12, true, false,
            TEXT_ALIGN_RIGHT, green)

    end

end
