include("./styles.lua")

local active_color = white_color

function draw()

    -- active state
    pitch_stab = get(pitch_stab_on)
    if pitch_stab == 1 then
        active_color = green_color
    else
        active_color = white_color
    end

    -- pitch stab
    sasl.gl.drawRectangle(0, 0, 50, 50, button_color)

    sasl.gl.drawText(roboto, 25, 26, "PITCH", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    sasl.gl.drawText(roboto, 25, 14, "STAB", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

end
