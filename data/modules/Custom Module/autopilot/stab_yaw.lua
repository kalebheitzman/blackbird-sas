include("./styles.lua")

local active_color = yellow

function draw()

    -- active state
    yaw_stab = get(yaw_stab_on)
    if yaw_stab == 1 then
        active_color = green
    else
        active_color = yellow
    end

    -- yaw stab
    sasl.gl.drawRectangle(0, 0, 50, 50, button)
    sasl.gl.drawText(roboto, 25, 26, "YAW", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    sasl.gl.drawText(roboto, 25, 14, "STAB", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

end
