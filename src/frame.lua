---@class Frame Кадр
---@field public W number
---@field public H number
---@field public HALF_W number
---@field public HALF_H number
---@field _image Image
---@field _quad Quad
---@field _is_xmirror boolean
local Frame = {}
Frame.__index = Frame

---@param self Frame
---@param image Image
---@param quad Quad
---@param is_xmirror boolean
---@return Frame
function Frame.init(self, image, quad, is_xmirror)
    assert_fox(image)
    assert_fox(quad)
    local obj = {}
    obj._image = image
    obj._quad = quad
    obj._is_xmirror = is_xmirror or false
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
    local x_ = x
    local sx = 1
    local sy = 1
    if self._is_xmirror then
        sx = -1
        x_ = x_ + self.H
    end
    love.graphics.draw(self._image, self._quad, x_, y, r, sx, sy)
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
        love.graphics.setColor(.0, 1., .0, 1.)
        --love.graphics.rectangle('line', x, y, self.W, self.H)

        --todo поправка на поворот
        x = x + self.HALF_W
        y = y + self.HALF_H
        love.graphics.circle('line', x, y, 5)

        local x1 = x - self.HALF_W
        local y1 = y - self.HALF_H
        local x2 = x + self.HALF_W
        local y2 = y - self.HALF_H
        local x3 = x + self.HALF_W
        local y3 = y + self.HALF_H
        local x4 = x - self.HALF_W
        local y4 = y + self.HALF_H
        love.graphics.polygon('line', x1, y1, x2, y2, x3, y3, x4, y4)

        love.graphics.setColor(r_, g, b, a)
    end
end

return Frame
