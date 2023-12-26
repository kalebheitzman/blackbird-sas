include("./styles.lua")
include("./functions.lua")

local active_color = yellow

function draw()

    -- active state
    heading_dial_deg_mag_pilot_ref = get(heading_dial_deg_mag_pilot)
    heading_mode_ref = get(heading_mode)
    heading_is_gpss_ref = get(heading_is_gpss)
    if heading_mode_ref == 1 and heading_is_gpss_ref == 0 then
        active_color = green
    elseif heading_mode_ref == 12 then
        active_color = inactive_color
    else
        active_color = yellow
    end

    -- heading hold
    sasl.gl.drawRectangle(0, 0, 50, 50, button)
    sasl.gl.drawText(roboto, 25, 26, "HDG", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    sasl.gl.drawText(roboto, 25, 14, "HOLD", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    if heading_mode_ref == 1 and heading_is_gpss_ref == 0 then
        sasl.gl.drawText(roboto, 25, 5, round(heading_dial_deg_mag_pilot_ref, 0), 8, false, false, TEXT_ALIGN_CENTER,
            white)

        theta = math.rad(-(heading_dial_deg_mag_pilot_ref - 90))
        local x, y = squareBoundaryPoint(theta)
        sasl.gl.drawRectangle(x + 23, y + 23, 3, 3, green)
    end

end

