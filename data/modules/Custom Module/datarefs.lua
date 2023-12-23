include("./styles.lua")

-- ap
servos_on = globalProperty("sim/cockpit2/autopilot/servos_on")
fd_mode = globalProperty("sim/cockpit2/autopilot/flight_director_mode")
override_joystick = globalProperty("sim/operation/override/override_joystick")

-- stability augmentation
pitch_stab_on = globalProperty("sim/cockpit2/switches/artificial_stability_pitch_on")
roll_stab_on = globalProperty("sim/cockpit2/switches/artificial_stability_roll_on")
yaw_stab_on = globalProperty("sim/cockpit2/switches/yaw_damper_on")
override_autopilot = globalProperty("sim/operation/override/override_autopilot")

-- vertical modes
-- autopilot constants
-- pitch prediction         +01.0
-- pitch tune-time          02.0
-- pitch degrees per knot   +0.05
alititude = globalProperty("sim/cockpit2/gauges/indicators/altitude_ft_pilot")
altitude_mode = globalProperty("sim/cockpit2/autopilot/altitude_mode")
airspeed_kts = globalProperty("sim/cockpit2/gauges/indicators/calibrated_airspeed_kts_pilot")
airspeed_mach = globalProperty("sim/cockpit2/gauges/indicators/mach_pilot")
airspeed_is_mach = globalProperty("sim/cockpit2/autopilot/airspeed_is_mach")
airspeed_dial_kts = globalProperty("sim/cockpit2/autopilot/airspeed_dial_kts")
airspeed_dial_kts_mach = globalProperty("sim/cockpit2/autopilot/airspeed_dial_kts_mach")
sync_hold_pitch_deg = globalProperty("sim/cockpit2/autopilot/sync_hold_pitch_deg")
pitch_electric_deg_pilot = globalProperty("sim/cockpit2/gauges/indicators/pitch_electric_deg_pilot")

-- lateral modes
-- Autopilot lateral mode. (0=roll, 1=heading sel, 2=nav, 10=TO/GA, 11=Re-entry, 12=Free, 13=GPSS, 14=heading hold, 15=turn-rate, 16=rollout, 18=track) 
-- Writeable with override only (sim/operation/override/override_autopilot)
-- roll prediction          +01.0
-- roll response time       06.0
-- roll tune-trim           04.0
heading_mode = globalProperty("sim/cockpit2/autopilot/heading_mode")
heading_status = globalProperty("sim/cockpit2/autopilot/heading_status")
heading_is_gpss = globalProperty("sim/cockpit2/autopilot/heading_is_gpss")
set(heading_is_gpss, 1)
heading_dial_deg_mag_pilot = globalProperty("sim/cockpit2/autopilot/heading_dial_deg_mag_pilot")
hsi_obs_deg_mag_pilot = globalProperty("sim/cockpit2/radios/actuators/hsi_obs_deg_mag_pilot")
hnav_armed = globalProperty("sim/cockpit2/autopilot/hnav_armed")
sync_hold_roll_deg = globalProperty("sim/cockpit2/autopilot/sync_hold_roll_deg")
roll_electric_deg_pilot = globalProperty("sim/cockpit2/gauges/indicators/roll_electric_deg_pilot")

-- schedule
schedule_on = createProperty("bluegrass/sr71/schedule_on")
airspeed_kts_const = createProperty("bluegrass/sr71/airspeed_kts_const")
airspeed_mach_const = createProperty("bluegrass/sr71/airspeed_mach_const")
set(airspeed_kts_const, get(airspeed_kts))
set(airspeed_mach_const, get(airspeed_mach))
set(schedule_on, 0)
