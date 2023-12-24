include("../styles.lua")

function draw()
    sasl.gl.drawRectangle(0, 0, 30, 30, button_color)
    sasl.gl.drawText(roboto, 15, 10, "0", 12, true, false, TEXT_ALIGN_CENTER, white_color)
end
