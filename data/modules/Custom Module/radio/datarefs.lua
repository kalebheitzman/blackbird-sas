-- tacan refs
tac1_channel = globalProperty("sim/cockpit2/radios/actuators/tac1_channel") -- 1-126
tac1_mode = globalProperty("sim/cockpit2/radios/actuators/tac1_mode") -- X: 88 / Y: 89
tac2_channel = globalProperty("sim/cockpit2/radios/actuators/tac2_channel") -- 1-126
tac2_mode = globalProperty("sim/cockpit2/radios/actuators/tac2_mode") -- X: 88 / Y: 89
nav1_frequency_Mhz = globalProperty("sim/cockpit2/radios/actuators/nav1_frequency_Mhz")
nav1_frequency_khz = globalProperty("sim/cockpit2/radios/actuators/nav1_frequency_khz")
nav2_frequency_Mhz = globalProperty("sim/cockpit2/radios/actuators/nav2_frequency_Mhz")
nav2_frequency_khz = globalProperty("sim/cockpit2/radios/actuators/nav2_frequency_khz")
com1_frequency_Mhz = globalProperty("sim/cockpit2/radios/actuators/com1_frequency_Mhz")
com1_frequency_khz = globalProperty("sim/cockpit2/radios/actuators/com1_frequency_khz")
com2_frequency_Mhz = globalProperty("sim/cockpit2/radios/actuators/com2_frequency_Mhz")
com2_frequency_khz = globalProperty("sim/cockpit2/radios/actuators/com2_frequency_khz")

-- local refs
local_tac_channel = createProperty("bluegrass/sr71/radios/tacan_channel")
local_tac_mode = createProperty("bluegrass/sr71/radios/tacan_mode")
local_nav_Mhz = createProperty("bluegrass/sr71/radios/nav_Mhz")
local_nav_khz = createProperty("bluegrass/sr71/radios/nav_khz")
local_com_Mhz = createProperty("bluegrass/sr71/radios/com_Mhz")
local_com_khz = createProperty("bluegrass/sr71/radios/com_khz")
init_nav_entry = createProperty("bluegrass/sr71/radios/init_nav_entry")
init_com_entry = createProperty("bluegrass/sr71/radios/init_com_entry")
radio_mode = createProperty("bluegrass/sr71/radios/mode")

-- set initial state
set(local_tac_channel, 0)
set(local_tac_mode, 0)
set(local_nav_Mhz, get(nav2_frequency_Mhz))
set(local_nav_khz, get(nav2_frequency_khz))
set(local_com_Mhz, get(com2_frequency_Mhz))
set(local_com_khz, get(com2_frequency_khz))
set(radio_mode, 0)
set(init_nav_entry, 1)
set(init_com_entry, 1)
