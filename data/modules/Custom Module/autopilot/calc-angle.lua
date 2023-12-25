-- Function to convert degrees to radians
function deg2rad(degrees)
    return degrees * (math.pi / 180)
end

-- Function to calculate the Haversine distance between two points
function haversine(lat1, lon1, lat2, lon2)
    local R = 6371 -- Earth's radius in kilometers
    local dlat = deg2rad(lat2 - lat1)
    local dlon = deg2rad(lon2 - lon1)

    local a = math.sin(dlat / 2) * math.sin(dlat / 2) + math.cos(deg2rad(lat1)) * math.cos(deg2rad(lat2)) *
                  math.sin(dlon / 2) * math.sin(dlon / 2)

    local c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

    local distance = R * c -- Distance in kilometers
    return distance
end

-- Function to calculate the angle given three points
function calculateAngle(lat1, lon1, lat2, lon2, lat3, lon3)
    local a = haversine(lat2, lon2, lat3, lon3)
    local b = haversine(lat1, lon1, lat3, lon3)
    local c = haversine(lat1, lon1, lat2, lon2)

    -- Law of Cosines to calculate the angle
    local angle = math.acos((a ^ 2 + c ^ 2 - b ^ 2) / (2 * a * c))

    -- Convert angle from radians to degrees
    angle = angle * (180 / math.pi)

    return angle
end

