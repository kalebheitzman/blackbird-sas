-------------------------------------------------------------------------------
-- Rectangle
-------------------------------------------------------------------------------

defineProperty("color", { 0.15, 0.15, 0.15, 1.0 })

function draw()
    local c = get(color)
    sasl.gl.drawRectangle(0, 0, size[1], size[2], c)
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

