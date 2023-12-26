include("../styles.lua")

function draw()

    radio_mode_ref = get(radio_mode)

    active_color = white
    if radio_mode_ref == 0 then
        active_color = green
    end

    sasl.gl.drawRectangle(0, 0, 60, 30, button)
    sasl.gl.drawText(roboto, 30, 11, "TAC", 9, true, false, TEXT_ALIGN_CENTER, active_color)
end
