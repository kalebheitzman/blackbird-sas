include("../styles.lua")

function draw()

    sasl.gl.drawRectangle(0, 0, 82, 30, button_color)

    radio_mode_ref = get(radio_mode)
    if radio_mode_ref == 0 then
        local_tac_channel_ref = get(local_tac_channel)
        local_tac_mode_ref = get(local_tac_mode)

        mode = "--"
        if local_tac_mode_ref == 88 then
            mode = "X"
        elseif local_tac_mode_ref == 89 then
            mode = "Y"
        end

        channel = "--"
        if local_tac_channel_ref ~= 0 then
            channel = local_tac_channel_ref
        end

        sasl.gl.drawText(roboto, 64, 10, channel, 12, true, false, TEXT_ALIGN_RIGHT, white_color)
        sasl.gl.drawText(roboto, 65, 10, mode, 12, true, false, TEXT_ALIGN_LEFT, white_color)

    elseif radio_mode_ref == 1 then
        local_nav_Mhz_ref = get(local_nav_Mhz)
        local_nav_khz_ref = get(local_nav_khz)

        sasl.gl.drawText(roboto, 71, 10, local_nav_Mhz_ref .. "." .. local_nav_khz_ref, 12, true, false,
            TEXT_ALIGN_RIGHT, white_color)
    elseif radio_mode_ref == 2 then
        local_com_Mhz_ref = get(local_com_Mhz)
        local_com_khz_ref = get(local_com_khz)

        sasl.gl.drawText(roboto, 71, 10, local_com_Mhz_ref .. "." .. local_com_khz_ref, 12, true, false,
            TEXT_ALIGN_RIGHT, white_color)

    end

end
