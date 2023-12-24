function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then
        x = math.floor(x + 0.5)
    else
        x = math.ceil(x - 0.5)
    end
    return x / n
end

function squareBoundaryPoint(theta)
    local sideLength = 47
    local a = sideLength / 2

    theta = normalizeAngle(theta)

    local x, y

    if theta >= 0 and theta < math.pi / 4 then
        x = a
        y = a * math.tan(theta)
    elseif theta >= math.pi / 4 and theta < 3 * math.pi / 4 then
        x = a / math.tan(theta)
        y = a
    elseif theta >= 3 * math.pi / 4 and theta < 5 * math.pi / 4 then
        x = -a
        y = -a * math.tan(theta)
    elseif theta >= 5 * math.pi / 4 and theta < 7 * math.pi / 4 then
        x = -a / math.tan(theta)
        y = -a
    else
        x = a
        y = a * math.tan(theta)
    end

    -- x = x - 1.5
    -- y = y - 1.5

    return x, y
end

function normalizeAngle(theta)
    return theta % (2 * math.pi)
end
