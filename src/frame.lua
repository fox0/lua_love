local Frame = {}
Frame.__index = Frame

---@param image Image
---@param quad Quad
---@return Frame
function Frame:init(image, quad)
    assert(image)
    assert(quad)
    ---@class Frame Кадр
    local obj = {}
    obj._image = image
    obj._quad = quad
    ---@type number
    local _, _, w, h = quad:getViewport()  -- 92x92
    obj.W, obj.H = w, h
    return setmetatable(obj, Frame)
end

---@param x number
---@param y number
---@param r number
---@param is_mirror boolean
function Frame:draw(x, y, r, is_mirror)
    local sx = (is_mirror and -1) or 1
    local ox = (is_mirror and self.W) or 0
    love.graphics.draw(self._image, self._quad, x, y, r, sx, 1, ox, 0)
    --if is_debug_gui then
    --    self:_debug_draw(x, y, r)
    --end
end

-----@param x number
-----@param y number
-----@param r number
--function Frame:_debug_draw(x, y, r)
--    local r_, g, b, a = love.graphics.getColor()
--
--    --локальный центр координат
--    love.graphics.setColor(0.0, 1.0, 0.0, 1.0)
--    --love.graphics.circle('line', x, y, 3)
--
--    --рамка
--    local x2, y2 = rotate_point(self.W, 0, r)
--    local x3, y3 = rotate_point(self.W, self.H, r)
--    local x4, y4 = rotate_point(0, self.H, r)
--    love.graphics.polygon('line', 0 + x, 0 + y, x2 + x, y2 + y, x3 + x, y3 + y, x4 + x, y4 + y)
--
--    --отладочная инфа
--    local s = 16
--    love.graphics.setColor(0.0, 0.0, 0.0, 0.5)
--    love.graphics.rectangle('fill', x, y - s, self.W, s)
--    love.graphics.setColor(0.0, 1.0, 0.0, 1.0)
--    love.graphics.print(string.format('(%d; %d) %d', x, y, math.deg(r)), x, y - s)
--
--    love.graphics.setColor(r_, g, b, a)
--end

return Frame
