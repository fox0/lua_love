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

--- Геометрическая сумма
---@param x number
---@param y number
---@return number
function math.sum_geometry(x, y)
    return math.sqrt(math.pow(x, 2) + math.pow(y, 2))
end

--- Нормализовать точку из диапазона
---@param x number
---@param a number Начало диапазона
---@param b number Конец диапазона
---@return number [0.0;1.0]
function normalize(x, a, b)
    assert(a < b, string.format('assert error: %.2f < %.f2', a, b))
    local result = (x - a) / (b - a)
    result = math.max(0.0, result)
    result = math.min(1.0, result)
    return result
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

--todo проверить. Сейчас нельзя крутить мёртвые петли :(
function normalize_angle(angle)
    return math.pi / 2 - (angle % math.pi)
end
