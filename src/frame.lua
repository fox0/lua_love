---@class Frame Кадр
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
    local r = 0 --rotate
    local sx = 1
    local sy = 1
    if self._is_xmirror then
        --todo
    end
    love.graphics.draw(self._image, self._quad, x, y, r, sx, sy)
end

return Frame
