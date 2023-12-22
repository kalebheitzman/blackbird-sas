include("./styles.lua")

local active_color = white

function draw()

    heading_mode_ref = get(heading_mode)
    heading_is_gpss_ref = get(heading_is_gpss)
    altitude_mode_ref = get(altitude_mode)

    -- ins
    sasl.gl.drawRectangle(0, 74, 60, 31, black)
    ins_color = white
    if heading_is_gpss_ref == 1 then
        ins_color = green
    end
    sasl.gl.drawText(roboto, 30, 85, "INS", font_size, true, false, TEXT_ALIGN_CENTER, ins_color)

    -- tacan
    tacan_color = white
    if heading_mode_ref == 2 and heading_is_gpss_ref == 0 then
        tacan_color = green
    end
    sasl.gl.drawRectangle(0, 37, 60, 31, black)
    sasl.gl.drawText(roboto, 30, 49, "TACAN", font_size, true, false, TEXT_ALIGN_CENTER, tacan_color)

    -- ils
    ils_color = white
    if altitude_mode_ref == 8 then
        ils_color = green
    end
    sasl.gl.drawRectangle(0, 0, 60, 31, black)
    sasl.gl.drawText(roboto, 30, 12, "ILS", font_size, true, false, TEXT_ALIGN_CENTER, ils_color)

end
