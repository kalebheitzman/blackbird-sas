include("../styles.lua")

function draw()
    sasl.gl.drawRectangle(0, 0, 30, 30, button)
    sasl.gl.drawText(roboto, 15, 10, "8", 12, true, false, TEXT_ALIGN_CENTER, white)
end
