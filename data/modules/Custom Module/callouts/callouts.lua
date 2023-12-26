include("../styles.lua")
include("./datarefs.lua")
include("./calc-turntime.lua")
include("./calc-descent.lua")

include("../autopilot/functions.lua")

function draw()
    sasl.gl.drawRectangle(0, 0, 335, 30, button)

    true_airspeed_kts_pilot_ref = get(true_airspeed_kts_pilot)
    -- ground_speed_kt_ref = get(ground_speed_kt)
    count = sasl.countFMSEntries()
    idx = sasl.getDestinationFMSEntry()

    type1, name1, id1, alt1, lat1, lon1 = sasl.getFMSEntryInfo(idx - 1)
    type2, name2, id2, alt2, lat2, lon2 = sasl.getFMSEntryInfo(idx)
    type3, name3, id3, alt3, lat3, lon3 = sasl.getFMSEntryInfo(idx + 1)

    sasl.logInfo(idx, name1, name2, name3)
    -- local angle = -(90 - calculateAngle(lat1, lon1, lat2, lon2, lat3, lon3))
    -- local turntime = calculateTurnTime(true_airspeed_kts_pilot_ref, angle)
    -- local turnDistance = calculateTurnDistance(true_airspeed_kts_pilot_ref, angle, ground_speed_kt_ref)

    -- sasl.logInfo(true_airspeed_kts_pilot_ref, angle, ground_speed_kt_ref, turntime, turnDistance)

    bankAngle = 30
    windDirection = get(wind_heading_deg_mag)
    windSpeed = get(wind_speed_kts)
    gps_xtk_ref = get(gps_xtk)

    turneResults = calculateTurnParameters({lat1, lon1}, {lat2, lon2}, {lat3, lon3}, true_airspeed_kts_pilot_ref,
        bankAngle, windDirection, windSpeed, gps_xtk_ref)

    sasl.logInfo(lat1, lon1, lat2, lon2, lat3, lon3, true_airspeed_kts_pilot_ref, bankAngle)
    for key, value in pairs(turneResults) do
        sasl.logInfo(key .. ": " .. value)
    end
    sasl.logInfo("turnIn: ", get(gps_dme_distance_nm) - turneResults.startTurnDistance)

    altitude_ft_pilot_ref = get(altitude_ft_pilot)
    target_altitude = 3000
    speed = 365
    outside_air_temp_degc_ref = get(outside_air_temp_degc)
    descentResults = calculateDescent(altitude_ft_pilot_ref, target_altitude, windSpeed, windDirection, speed,
        outside_air_temp_degc_ref)

    -- Output the result
    for key, value in pairs(descentResults) do
        print(key .. ": " .. value)
    end

    -- sasl.logInfo(distance)
    sasl.logInfo("-----")

    local turnIn = "TURN: " .. round(get(gps_dme_distance_nm) - turneResults.startTurnDistance, 2) .. "nm"
    local offTrack = "XTK: " .. round(gps_xtk_ref, 2) .. "nm"
    local descentDistance = "Descent: " .. round(descentResults.descentDistance, 2) .. "nm"

    sasl.gl.drawText(roboto, 10, 10, turnIn, 12, false, false, TEXT_ALIGN_LEFT, green)
    sasl.gl.drawText(roboto, 115, 10, offTrack, 12, false, false, TEXT_ALIGN_LEFT, green)
    sasl.gl.drawText(roboto, 210, 10, descentDistance, 12, false, false, TEXT_ALIGN_LEFT, green)

end
