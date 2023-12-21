include("./styles.lua")

local active_color = white

function draw()

    heading_mode_ref = get(heading_mode)
    heading_is_gpss_ref = get(heading_is_gpss)

    -- ins
    sasl.gl.drawRectangle(0, 86.5, 60, 38.5, black)
    ins_color = white
    if heading_is_gpss_ref == 1 then
        ins_color = green
    end
    sasl.gl.drawText(roboto, 30, 101, "INS", font_size, true, false, TEXT_ALIGN_CENTER, ins_color)

    -- tacan
    tacan_color = white
    if heading_mode_ref == 2 and heading_is_gpss_ref == 0 then
        tacan_color = green
    end
    sasl.gl.drawRectangle(0, 43, 60, 38.5, black)
    sasl.gl.drawText(roboto, 30, 57.5, "TACAN", font_size, true, false, TEXT_ALIGN_CENTER, tacan_color)

    -- ils
    sasl.gl.drawRectangle(0, 0, 60, 38.5, black)
    sasl.gl.drawText(roboto, 30, 15, "ILS", font_size, true, false, TEXT_ALIGN_CENTER, active_color)

end
