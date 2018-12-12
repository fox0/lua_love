local Frame = {}
Frame.__index = Frame

---@param self Frame
---@param image Image
---@param quad Quad
---@param is_xmirror boolean
---@return Frame
function Frame.init(self, image, quad, is_xmirror)
    assert(image)
    assert(quad)
    ---@class Frame Кадр
    local obj = {}
    obj._image = image
    obj._quad = quad
    obj._is_xmirror = is_xmirror or false
    ---@type number
    local _, _, w, h = quad:getViewport()  -- 92x92
    obj.W = w
    obj.H = h
    obj.HALF_W = w / 2
    obj.HALF_H = h / 2
    return setmetatable(obj, Frame)
end

---@param self Frame
---@param x number
---@param y number
---@param r number
function Frame.draw(self, x, y, r)
    local sx, ox = 1, 0
    if self._is_xmirror then
        sx = -1
        ox = self.W
    end
    love.graphics.draw(self._image, self._quad, x, y, r, sx, 1, ox, 0)
    self:_debug_draw(x, y, r)
end

function Frame._debug_draw()

end

if log.level == 'debug' then
    ---@param self Frame
    ---@param x number
    ---@param y number
    ---@param r number
    function Frame._debug_draw(self, x, y, r)
        local r_, g, b, a = love.graphics.getColor()

        --локальный центр координат
        love.graphics.setColor(0.0, 1.0, 0.0, 1.0)
        love.graphics.circle('line', x, y, 3)

        --рамка
        local x2, y2 = rotate_point(self.W, 0, r)
        local x3, y3 = rotate_point(self.W, self.H, r)
        local x4, y4 = rotate_point(0, self.H, r)
        love.graphics.polygon('line', 0 + x, 0 + y, x2 + x, y2 + y, x3 + x, y3 + y, x4 + x, y4 + y)

        --отладочная инфа
        love.graphics.setColor(0.0, 0.0, 0.0, 0.5)
        love.graphics.rectangle('fill', x, y - 16, self.W, 16)
        love.graphics.setColor(0.0, 1.0, 0.0, 1.0)
        love.graphics.print(string.format('(%d; %d) %d', x, y, r * (180 / math.pi)), x, y - 16)

        love.graphics.setColor(r_, g, b, a)
    end
end

return Frame
