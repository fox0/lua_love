local m = {}

local vars = {}

--- Типа конструктор
---@param args table
function m.init(args)

end

--- Типа деструктор
--- необязательно
function m.exit()

    vars = nil
end

--- необязательно
---@param k string
function m.keypressed(k)

end

--- необязательно
---@param k string
function m.keyreleased(k)

end

---@param dt number
function m.update(dt)

end

function m.draw()

end

return m
