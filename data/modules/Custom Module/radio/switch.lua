include("../styles.lua")

function draw()
    sasl.gl.drawRectangle(0, 0, 30, 30, button)
    sasl.gl.drawTriangle(10, 15, 20, 20, 20, 10, white)
end
