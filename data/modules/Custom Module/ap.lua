include("./styles.lua")

local active_color = white

function draw()

    -- active state
    ap_engaged = get(ap_on)
    if ap_engaged == 1 then
        active_color = green
    else
        active_color = white
    end

    -- ap button
    sasl.gl.drawRectangle(0, 0, 50, 50, black)
    sasl.gl.drawText(roboto, 25, 20, "A/P", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

end

