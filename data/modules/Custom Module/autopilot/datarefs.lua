include("./styles.lua")

-- ap
servos_on = globalProperty("sim/cockpit2/autopilot/servos_on")
flight_director_mode = globalProperty("sim/cockpit2/autopilot/flight_director_mode")
override_joystick = globalProperty("sim/operation/override/override_joystick")
override_autopilot = globalProperty("sim/operation/override/override_autopilot")

-- stability augmentation
pitch_stab_on = globalProperty("sim/cockpit2/switches/artificial_stability_pitch_on")
roll_stab_on = globalProperty("sim/cockpit2/switches/artificial_stability_roll_on")
yaw_stab_on = globalProperty("sim/cockpit2/switches/yaw_damper_on")

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
true_airspeed_kts_pilot = globalProperty("sim/cockpit2/gauges/indicators/true_airspeed_kts_pilot")
ground_speed_kt = globalProperty("sim/cockpit2/gauges/indicators/ground_speed_kt")
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
-- set(heading_is_gpss, 1)
heading_dial_deg_mag_pilot = globalProperty("sim/cockpit2/autopilot/heading_dial_deg_mag_pilot")
heading_electric_deg_mag_pilot = globalProperty("sim/cockpit2/gauges/indicators/heading_electric_deg_mag_pilot")
gps_bearing_deg_mag = globalProperty("sim/cockpit2/radios/indicators/gps_bearing_deg_mag")
hsi_obs_deg_mag_pilot = globalProperty("sim/cockpit2/radios/actuators/hsi_obs_deg_mag_pilot")
hnav_armed = globalProperty("sim/cockpit2/autopilot/hnav_armed")
sync_hold_roll_deg = globalProperty("sim/cockpit2/autopilot/sync_hold_roll_deg")
roll_electric_deg_pilot = globalProperty("sim/cockpit2/gauges/indicators/roll_electric_deg_pilot")
bank_angle_mode = globalProperty("sim/cockpit2/autopilot/bank_angle_mode")
bank_angles_values = globalProperty("sim/cockpit2/autopilot/bank_angles_values")
override_flightdir_roll = globalProperty("sim/operation/override/override_flightdir_roll")
flight_director_roll = globalProperty("sim/cockpit/autopilot/flight_director_roll")
gps_hdef_dots_pilot = globalProperty("sim/cockpit2/radios/indicators/gps_hdef_dots_pilot")
gps_dme_distance_nm = globalProperty("sim/cockpit2/radios/indicators/gps_dme_distance_nm")
gps_xtk = globalProperty("sim/cockpit2/radios/indicators/gps_xtk")

-- schedule
schedule_on = createProperty("bluegrass/sr71/sas/schedule_on")
airspeed_kts_const = createProperty("bluegrass/sr71/sas/airspeed_kts_const")
airspeed_mach_const = createProperty("bluegrass/sr71/sas/airspeed_mach_const")
set(airspeed_kts_const, get(airspeed_kts))
set(airspeed_mach_const, get(airspeed_mach))
set(schedule_on, 0)

-- ap state storage
heading_mode_state = createProperty("bluegrass/sr71/sas/heading_mode_state")
heading_is_gpss_state = createProperty("bluegrass/sr71/sas/heading_is_gpss_state")
altitude_mode_state = createProperty("bluegrass/sr71/sas/altitude_mode_state")
set(heading_mode_state, get(heading_mode))
set(heading_is_gpss_state, get(heading_is_gpss))
set(altitude_mode_state, get(altitude_mode))

-- other
wind_heading_deg_mag = globalProperty("sim/cockpit2/gauges/indicators/wind_heading_deg_mag")
wind_speed_kts = globalProperty("sim/cockpit2/gauges/indicators/wind_speed_kts")
