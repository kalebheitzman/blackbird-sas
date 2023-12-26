include("./styles.lua")
include("./functions.lua")

local active_color = yellow

function draw()

    -- active state
    heading_mode_ref = get(heading_mode)
    sync_hold_roll_deg_ref = get(sync_hold_roll_deg)

    if heading_mode_ref == 0 then
        active_color = green
    else
        active_color = yellow
    end

    -- pitch stab
    sasl.gl.drawRectangle(0, 0, 50, 50, button)

    sasl.gl.drawText(roboto, 25, 20, "ROLL", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    if heading_mode_ref == 0 then
        bank_range = bank_max * 2
        current_bank = sync_hold_roll_deg_ref + bank_range
        current_roll_xcoord = (current_bank / bank_range) * 25 - 1.5
        zero_roll_xcoord = 23.5

        sasl.gl.drawRectangle(current_roll_xcoord, 0, 3, 3, green)
        sasl.gl.drawRectangle(zero_roll_xcoord, 0, 3, 3, indicator)
        sasl.gl.drawText(roboto, 25, 11, round(sync_hold_roll_deg_ref, 2), 8, false, false, TEXT_ALIGN_CENTER, white)
    end
end
