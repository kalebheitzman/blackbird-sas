-- Function to calculate Haversine distance between two coordinates
function haversine(lat1, lon1, lat2, lon2)
    local R = 6371000 -- Radius of the Earth in meters
    local dLat = math.rad(lat2 - lat1)
    local dLon = math.rad(lon2 - lon1)
    local a = math.sin(dLat / 2) * math.sin(dLat / 2) + math.cos(math.rad(lat1)) * math.cos(math.rad(lat2)) *
                  math.sin(dLon / 2) * math.sin(dLon / 2)
    local c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
    local distance = R * c
    return distance / 1852 -- Convert meters to nautical miles
end

-- Function to calculate turn parameters with offtrack information
function calculateTurnParameters(coord1, coord2, coord3, trueAirspeed, bankAngle, windDirection, windSpeed, offtrack)
    -- Convert coordinates from degrees to radians
    local lat1, lon1 = math.rad(coord1[1]), math.rad(coord1[2])
    local lat2, lon2 = math.rad(coord2[1]), math.rad(coord2[2])
    local lat3, lon3 = math.rad(coord3[1]), math.rad(coord3[2])

    -- Calculate initial and desired courses
    local initialCourse = math.atan2(math.sin(lon2 - lon1) * math.cos(lat2), math.cos(lat1) * math.sin(lat2) -
        math.sin(lat1) * math.cos(lat2) * math.cos(lon2 - lon1))

    local desiredCourse = math.atan2(math.sin(lon3 - lon2) * math.cos(lat3), math.cos(lat2) * math.sin(lat3) -
        math.sin(lat2) * math.cos(lat3) * math.cos(lon3 - lon2))

    -- Calculate angle between initial and desired courses
    local turnAngle = desiredCourse - initialCourse

    -- Calculate the radius of turn
    local trueAirspeed_mps = trueAirspeed * 0.5144
    local turnRadius = (trueAirspeed_mps ^ 2) / (9.81 * math.tan(math.rad(bankAngle)))

    -- Calculate the wind correction angle
    local windCorrectionAngle = math.atan2(windSpeed * math.sin(math.rad(windDirection - initialCourse)),
        trueAirspeed + windSpeed * math.cos(math.rad(windDirection - initialCourse)))

    -- Calculate the time to complete the turn (assuming constant bank angle)
    local turnTime = math.abs(turnAngle) / math.rad(bankAngle) * (180 / math.pi)

    -- Conversion factor from meters to nautical miles
    local metersToNauticalMiles = 0.00053996

    -- Calculate the distance before coordinate 2 to start the turn
    local startTurnDistance = (turnRadius + offtrack) *
                                  math.tan(math.abs(windCorrectionAngle - math.abs(turnAngle) / 2)) *
                                  metersToNauticalMiles

    -- Calculate the distance after coordinate 2 when ending the turn
    local endTurnDistance = turnRadius * math.tan(math.abs(windCorrectionAngle + math.abs(turnAngle) / 2)) *
                                metersToNauticalMiles

    -- Calculate initial course distance between coord1 and coord2 using Haversine formula
    local initialCourseDistance = haversine(coord1[1], coord1[2], coord2[1], coord2[2])

    -- Calculate desired course distance between coord2 and coord3 using Haversine formula
    local desiredCourseDistance = haversine(coord2[1], coord2[2], coord3[1], coord3[2])

    return {
        turnAngle = math.deg(turnAngle),
        turnRadius = turnRadius,
        windCorrectionAngle = math.deg(windCorrectionAngle),
        startTurnDistance = startTurnDistance,
        endTurnDistance = endTurnDistance,
        turnTime = turnTime,
        initialCourseDistance = initialCourseDistance,
        desiredCourseDistance = desiredCourseDistance,
        offtrack = offtrack -- Include offtrack information
    }
end
