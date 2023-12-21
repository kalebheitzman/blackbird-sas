include("./styles.lua")
include("./functions.lua")

local active_color = white

function draw()

    -- active state
    altitude_mode_ref = get(altitude_mode)
    airspeed_is_mach_ref = get(airspeed_is_mach)
    airspeed_kts_const_ref = get(airspeed_kts_const)
    if altitude_mode_ref == 5 and airspeed_is_mach_ref == 0 then
        active_color = green
    else
        active_color = white
    end

    -- keas hold
    sasl.gl.drawRectangle(0, 0, 50, 50, black)
    sasl.gl.drawText(roboto, 25, 26, "KEAS", font_size, true, false, TEXT_ALIGN_CENTER, active_color)
    sasl.gl.drawText(roboto, 25, 14, "HOLD", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

    if altitude_mode_ref == 5 and airspeed_is_mach_ref == 0 then
        sasl.gl.drawText(roboto, 25, 5, round(airspeed_kts_const_ref, 0), 8, false, false, TEXT_ALIGN_CENTER, white)
    end

end

