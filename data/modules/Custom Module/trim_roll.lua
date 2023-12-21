include("./styles.lua")
include("./functions.lua")

local active_color = white

function draw()

    -- active state
    heading_mode_ref = get(heading_mode)
    sync_hold_roll_deg_ref = get(sync_hold_roll_deg)

    if heading_mode_ref == 0 then
        active_color = green
    else
        active_color = white
    end

    -- pitch stab
    sasl.gl.drawRectangle(0, 0, 50, 50, black)

    sasl.gl.drawText(roboto, 25, 20, "ROLL", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    if heading_mode_ref == 0 then
        sasl.gl.drawText(roboto, 25, 11, round(sync_hold_roll_deg_ref, 2), 8, false, false, TEXT_ALIGN_CENTER, white)
    end
end

