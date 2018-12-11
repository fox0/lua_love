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
    local sx, sy, ox, oy = 1, 1, 0, 0
    if self._is_xmirror then
        sx = -1
        ox = self.W
    end
    love.graphics.draw(self._image, self._quad, x, y, r, sx, sy, ox, oy)
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
        love.graphics.setColor(0.0, 1.0, 0.0, 1.0)
        love.graphics.circle('line', x, y, 3)
        local x1 = x + math.cos(r) * self.W
        local y1 = y + math.sin(r) * self.H
        --vec2 rotate(vec2 point, float angle){
        --vec2 rotated_point;
        --rotated_point.x = point.x * cos(angle) - point.y * sin(angle);
        --rotated_point.y = point.x * sin(angle) + point.y * cos(angle);
        --return rotated_point;
        --}
        love.graphics.line(x, y, x1, y1)

        love.graphics.setColor(0.0, 0.0, 0.0, 0.5)
        love.graphics.rectangle('fill', x, y, self.W, 16)
        love.graphics.setColor(0.0, 1.0, 0.0, 1.0)
        love.graphics.print(string.format('(%d; %d) %d', x, y, r * (180 / math.pi)), x, y)

        love.graphics.setColor(r_, g, b, a)
    end
end

return Frame
