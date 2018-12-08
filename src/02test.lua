local m = {}

---@param args table
function m.init(args)
    ---@type Player
    player = args.player

end

--- Типа деструктор
function m.exit()

end

--- Обработчик отпущенных клавиш
---@param k string
function m.keyreleased(k)

end

---@param dt number
function m.update(dt)
    player:update(dt)
end

function m.draw()
    player:draw()
end

return m
