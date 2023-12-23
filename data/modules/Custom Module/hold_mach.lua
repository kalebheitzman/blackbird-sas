include("./styles.lua")
include("./functions")

local active_color = white_color

function draw()
    -- active state
    altitude_mode_ref = get(altitude_mode)
    airspeed_is_mach_ref = get(airspeed_is_mach)
    airspeed_mach_const_ref = get(airspeed_mach_const)
    if altitude_mode_ref == 5 and airspeed_is_mach_ref == 1 then
        active_color = green_color
    elseif altitude_mode_ref == 12 then
        active_color = inactive_color
    else
        active_color = white_color
    end

    -- mach hold
    sasl.gl.drawRectangle(0, 0, 50, 50, button_color)
    sasl.gl.drawText(roboto, 25, 26, "MACH", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    sasl.gl.drawText(roboto, 25, 14, "HOLD", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

    if altitude_mode_ref == 5 and airspeed_is_mach_ref == 1 then
        sasl.gl.drawText(roboto, 25, 5, round(airspeed_mach_const_ref, 2), 8, false, false, TEXT_ALIGN_CENTER,
            white_color)
    end

end
