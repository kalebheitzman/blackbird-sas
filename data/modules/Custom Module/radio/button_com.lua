include("../styles.lua")

function draw()

    radio_mode_ref = get(radio_mode)

    active_color = white_color
    if radio_mode_ref == 2 then
        active_color = green_color
    end

    sasl.gl.drawRectangle(0, 0, 60, 30, button_color)
    sasl.gl.drawText(roboto, 30, 11, "COM", 9, true, false, TEXT_ALIGN_CENTER, active_color)
end
