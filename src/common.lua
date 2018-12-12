----(Luc Bloom) http://lua-users.org/wiki/SimpleRound
-----@param v number
-----@return number
--function math.sign(v)
--    return (v >= 0 and 1) or -1
--end
--
----(Luc Bloom) http://lua-users.org/wiki/SimpleRound
-----@param v number
-----@param bracket number
-----@return number
--function math.round(v, bracket)
--    bracket = bracket or 1
--    return math.floor(v / bracket + math.sign(v) * 0.5) * bracket
--end

--- Повернуть точку на заданный угол
---@param x number
---@param y number
---@param r number
---@return number, number
function rotate_point(x, y, r)
    local sin, cos = math.sin(r), math.cos(r)
    return x * cos - y * sin, x * sin + y * cos
end

--todo
--function Player._normalize_angle(angle)
--    local result = angle % (2 * math.pi)
--    return result
--end
--
--if log.level == 'debug' then
--    assert(Player._normalize_angle(-4 * math.pi) == 0)
--    --is_equal(Player._normalize_angle(-3 * math.pi)== 0)
--    assert(Player._normalize_angle(-2 * math.pi) == 0)
--    assert(Player._normalize_angle(-math.pi) == math.pi)
--    assert(Player._normalize_angle(0) == 0)
--    assert(Player._normalize_angle(math.pi / 2) == math.pi / 2)
--    assert(Player._normalize_angle(math.pi) == math.pi)
--    assert(Player._normalize_angle(2 * math.pi) == 0)
--    assert(Player._normalize_angle(3 * math.pi) == math.pi)
--    assert(Player._normalize_angle(4 * math.pi) == 0)
--end
