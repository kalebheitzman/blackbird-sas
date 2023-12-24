include("../styles.lua")
include("./datarefs")

-- functions
include("./interaction.lua")

-- positions
pos_1 = {0, 35, 30, 30}
pos_2 = {35, 35, 30, 30}
pos_3 = {70, 35, 30, 30}
pos_4 = {105, 35, 30, 30}
pos_5 = {140, 35, 30, 30}
pos_6 = {0, 0, 30, 30}
pos_7 = {35, 0, 30, 30}
pos_8 = {70, 0, 30, 30}
pos_9 = {105, 0, 30, 30}
pos_0 = {140, 0, 30, 30}
pos_x = {175, 35, 30, 30}
pos_y = {175, 0, 30, 30}
pos_tac1 = {0, 70, 85, 30}
pos_tac2 = {88, 70, 85, 30}
pos_sw = {175, 70, 30, 30}
pos_tacbutton = {210, 70, 60, 30}
pos_navbutton = {210, 35, 60, 30}
pos_combutton = {210, 0, 60, 30}

-- tacan components
tacan_components = {num1 {
    position = pos_1
}, num2 {
    position = pos_2
}, num3 {
    position = pos_3
}, num4 {
    position = pos_4
}, num5 {
    position = pos_5
}, num6 {
    position = pos_6
}, num7 {
    position = pos_7
}, num8 {
    position = pos_8
}, num9 {
    position = pos_9
}, num0 {
    position = pos_0
}, modex {
    position = pos_x
}, modey {
    position = pos_y
}, tac1 {
    position = pos_tac1
}, tac2 {
    position = pos_tac2
}, switch {
    position = pos_sw
}, button_tac {
    position = pos_tacbutton
}, button_nav {
    position = pos_navbutton
}, button_com {
    position = pos_combutton
}}

function draw()
    drawAll(tacan_components)
end
