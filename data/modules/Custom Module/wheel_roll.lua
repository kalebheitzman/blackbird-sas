include("./styles.lua")

local active_color = white

function draw()

    hover_roll_left_color_ref = get(hover_roll_left_color)
    hover_roll_right_color_ref = get(hover_roll_right_color)

    -- pitch stab
    sasl.gl.drawRectangle(27.5, 0, 22.5, 50, black)
    sasl.gl.drawRectangle(0, 0, 22.5, 50, black)

    sasl.gl.drawTriangle(6, 25, 14, 32, 14, 18, hover_roll_left_color_ref)
    sasl.gl.drawTriangle(36, 32, 36, 18, 44, 25, hover_roll_right_color_ref)

end
