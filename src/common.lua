--(Luc Bloom) http://lua-users.org/wiki/SimpleRound
---@param v number
---@return number
function math.sign(v)
    return (v >= 0 and 1) or -1
end

--(Luc Bloom) http://lua-users.org/wiki/SimpleRound
---@param v number
---@param bracket number
---@return number
function math.round(v, bracket)
    bracket = bracket or 1
    return math.floor(v / bracket + math.sign(v) * 0.5) * bracket
end

--- Повернуть точку на заданный угол
---@param x number
---@param y number
---@param r number
---@return number, number
function rotate_point(x, y, r)
    local sin, cos = math.sin(r), math.cos(r)
    return x * cos - y * sin, x * sin + y * cos
end
