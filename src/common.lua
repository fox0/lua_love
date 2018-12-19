--(Luc Bloom) http://lua-users.org/wiki/SimpleRound
---@param v number
---@return number
function math.sign(v)
    return (v >= 0 and 1) or -1
end

--(Luc Bloom) http://lua-users.org/wiki/SimpleRound
---@overload fun(v:number):number
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
---@return number A normalized sample (range -1.0 to 1.0).
function math.normalize(x, a, b)
    --assert(a < b, string.format('assert error: %.2f < %.f2', a, b))
    local result = (x - a) / (b - a)
    result = math.max(0.0, result)
    result = math.min(1.0, result)
    return result
end

--- Повернуть точки на заданный угол
---@param x0 number
---@param y0 number
---@param r number
---@param list table Массив точек
---@return table
function math.rotate_point(x0, y0, r, list)
    local result = {}
    local sin, cos = math.sin(r), math.cos(r)
    local i = 1
    while i < #list do
        local x, y = list[i], list[i + 1]
        table.insert(result, x * cos - y * sin + x0)
        table.insert(result, x * sin + y * cos + y0)
        i = i + 2
    end
    --assert(#list == #result)
    return result
end

--todo проверить. Сейчас нельзя крутить мёртвые петли :(
function math.normalize_angle(angle)
    return math.pi / 2 - (angle % math.pi)
end

--- Медианный фильтр
---@overload fun():fun(x:number):number
---@param window number|nil
---@return fun(x:number):number
function math.get_median_smooth(window)
    window = window or 5
    assert(window % 2 == 1)
    local buf = {}
    for _ = 1, window do
        table.insert(buf, 0)
    end
    assert(#buf == window)
    local index = math.round(window / 2) + 1
    return function(x)
        table.remove(buf, 1)
        table.insert(buf, x)
        local buf2 = table.copy_array(buf)
        table.sort(buf2)
        return buf2[index]
    end
end

---@param t table
---@return table
function table.copy_array(t)
    local r = {}
    for i = 1, #t do
        r[i] = t[i]
    end
    return r
end
