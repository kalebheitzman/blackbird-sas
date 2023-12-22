include("./styles.lua")
include("./functions.lua")

local active_color = white

function draw()

    -- active state
    hsi_obs_deg_mag_pilot_ref = get(hsi_obs_deg_mag_pilot)
    heading_mode_ref = get(heading_mode)
    heading_status_ref = get(heading_status)
    heading_is_gpss_ref = get(heading_is_gpss)
    if ((heading_mode_ref == 18 or heading_mode_ref == 2 or heading_mode_ref == 1) and heading_status_ref == 0) or
        (heading_mode_ref == 1 and heading_is_gpss_ref == 1) then
        active_color = green
    else
        active_color = white
    end

    -- auto nav
    sasl.gl.drawRectangle(0, 0, 50, 50, black)
    sasl.gl.drawText(roboto, 25, 26, "AUTO", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    sasl.gl.drawText(roboto, 25, 14, "NAV", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

    if ((heading_mode_ref == 18 or heading_mode_ref == 2 or heading_mode_ref == 1) and heading_status_ref == 0) or
        (heading_mode_ref == 1 and heading_is_gpss_ref == 1) then
        sasl.gl.drawText(roboto, 25, 5, round(hsi_obs_deg_mag_pilot_ref, 0), 8, false, false, TEXT_ALIGN_CENTER, white)

    end
end
