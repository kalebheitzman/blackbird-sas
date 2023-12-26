include("./styles.lua")
include("./functions.lua")

local active_color = yellow

function draw()

    -- active state
    altitude_mode_ref = get(altitude_mode)
    sync_hold_pitch_deg_ref = get(sync_hold_pitch_deg)

    if altitude_mode_ref == 3 then
        active_color = green
    else
        active_color = yellow
    end

    -- pitch stab
    sasl.gl.drawRectangle(0, 0, 50, 50, button)

    sasl.gl.drawText(roboto, 25, 20, "PITCH", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    if altitude_mode_ref == 3 then
        current_pitch = sync_hold_pitch_deg_ref - pitch_min
        pitch_range = pitch_max - pitch_min
        curent_pitch_y = (current_pitch / pitch_range) * 47
        zero_pitch_y = (-pitch_min / pitch_range) * 47

        -- curent_pitch_y = get_pitch_indicator_location()
        sasl.gl.drawRectangle(0, zero_pitch_y, 3, 3, indicator)
        sasl.gl.drawRectangle(0, curent_pitch_y, 3, 3, green)
        sasl.gl.drawText(roboto, 25, 11, round(sync_hold_pitch_deg_ref, 2), 8, false, false, TEXT_ALIGN_CENTER, white)
    end
end
