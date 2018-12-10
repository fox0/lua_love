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
    local sx = 1
    local sy = 1
    if self._is_xmirror then  --todo bug зеркалировать не при выводе, а сам спрайт
        sx = -1
        x = x + self.H
    end
    love.graphics.draw(self._image, self._quad, x, y, r, sx, sy)
end

return Frame
