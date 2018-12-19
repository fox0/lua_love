--[[
Экран загрузки
]]--
local m = {}

local vars = {
    count = 0
}

function m.init()

end

---@param dt number
function m.update(dt)
    if vars.count > 1 then
        load_module('01menu')
    end
end

function m.draw()
    vars.count = vars.count + 1
    love.graphics.setBackgroundColor(const.BG_COLOR[1], const.BG_COLOR[2], const.BG_COLOR[3], const.BG_COLOR[4])
    love.graphics.print('Loading...', 480, 270)
end

return m
