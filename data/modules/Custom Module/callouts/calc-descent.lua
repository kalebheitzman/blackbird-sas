function calculateDescent(currentAltitude, targetAltitude, windSpeed, windDirection, equivalentAirSpeed,
    outsideAirTemperature)
    -- Constants
    local GRAVITY = 9.81 -- acceleration due to gravity in m/s^2
    local NM_TO_M = 1852 -- conversion factor from nautical miles to meters
    local KNOTS_TO_MS = 0.514444 -- conversion factor from knots to meters per second

    -- Calculate descent angle
    local descentAltitude = currentAltitude - targetAltitude
    local descentAngle = math.atan(descentAltitude / (NM_TO_M * 3)) -- Assuming a descent path of 3 nautical miles

    -- Calculate ground speed considering wind
    local windComponent = windSpeed * math.sin(math.rad(windDirection - 180))
    local groundSpeed = equivalentAirSpeed + windComponent

    -- Calculate descent time and distance
    local descentTime = descentAltitude / (math.tan(descentAngle) * GRAVITY)
    local descentDistance = groundSpeed * descentTime / KNOTS_TO_MS

    -- Create and return the result table
    local result = {
        descentAngle = math.deg(descentAngle),
        groundSpeed = groundSpeed,
        descentTime = descentTime,
        descentDistance = descentDistance / NM_TO_M
    }

    return result
end
