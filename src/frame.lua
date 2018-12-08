---@class Frame Кадр
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
    local obj = {}
    obj._image = image
    obj._quad = quad
    obj._is_xmirror = is_xmirror or false
    return setmetatable(obj, Frame)
end

---@param self Frame
---@param x number
---@param y number
function Frame.draw(self, x, y)
    self:_debug_draw(x, y)
    local r = 0 --rotate
    local sx = 1
    local sy = 1
    if self._is_xmirror then
        local _, _, w, h = self._quad:getViewport()
        sx = -1
        x = x + w
    end
    love.graphics.draw(self._image, self._quad, x, y, r, sx, sy)
end

function Frame._debug_draw()

end

if log.level == 'debug' then
    ---@param self Frame
    ---@param x number
    ---@param y number
    function Frame._debug_draw(self, x, y)
        local _, _, w, h = self._quad:getViewport()
        local r, g, b, a = love.graphics.getColor()
        love.graphics.setLineStyle('rough')
        love.graphics.setColor(.0, 1., .0, 1.)
        love.graphics.rectangle('line', x, y, w, h)
        love.graphics.setColor(r, g, b, a)
    end
end

return Frame
