include("./styles.lua")
include("./functions.lua")

local active_color = white

function draw()

    -- active state
    altitude_mode_ref = get(altitude_mode)
    sync_hold_pitch_deg_ref = get(sync_hold_pitch_deg)

    if altitude_mode_ref == 3 then
        active_color = green
    else
        active_color = white
    end

    -- pitch stab
    sasl.gl.drawRectangle(0, 0, 50, 50, black)

    sasl.gl.drawText(roboto, 25, 20, "PITCH", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    if altitude_mode_ref == 3 then
        sasl.gl.drawText(roboto, 25, 11, round(sync_hold_pitch_deg_ref, 2), 8, false, false, TEXT_ALIGN_CENTER, white)
    end
end
