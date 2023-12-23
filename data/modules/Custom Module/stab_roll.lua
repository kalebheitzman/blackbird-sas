include("./styles.lua")

local active_color = white_color

function draw()

    -- active state
    roll_stab = get(roll_stab_on)
    if roll_stab == 1 then
        active_color = green_color
    else
        active_color = white_color
    end

    -- roll stab
    sasl.gl.drawRectangle(0, 0, 50, 50, button_color)
    sasl.gl.drawText(roboto, 25, 26, "ROLL", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    sasl.gl.drawText(roboto, 25, 14, "STAB", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

end
