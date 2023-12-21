include("./styles.lua")

local active_color = white

function draw()

    hover_pitch_down_color_ref = get(hover_pitch_down_color)
    hover_pitch_up_color_ref = get(hover_pitch_up_color)

    -- pitch wheel
    sasl.gl.drawRectangle(0, 27.5, 50, 22.5, black)
    sasl.gl.drawRectangle(0, 0, 50, 22.5, black)

    sasl.gl.drawTriangle(17, 35, 25, 42, 32, 35, hover_pitch_down_color_ref)
    sasl.gl.drawTriangle(17, 15, 25, 8, 32, 15, hover_pitch_up_color_ref)

end
