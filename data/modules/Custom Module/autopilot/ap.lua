include("./styles.lua")

local active_color = yellow

function draw()

    -- active state
    flight_director_mode_ref = get(flight_director_mode)
    if flight_director_mode_ref == 2 then
        active_color = green
    else
        active_color = yellow
    end

    -- ap button
    sasl.gl.drawRectangle(0, 0, 50, 50, button)
    sasl.gl.drawText(roboto, 25, 20, "A/P", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

end

