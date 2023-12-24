include("./styles.lua")

local active_color = white_color

function draw()

    -- active state
    servos_on_ref = get(servos_on)
    if servos_on_ref == 1 then
        active_color = green_color
    else
        active_color = white_color
    end

    -- ap button
    sasl.gl.drawRectangle(0, 0, 50, 50, button_color)
    sasl.gl.drawText(roboto, 25, 20, "A/P", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

end

