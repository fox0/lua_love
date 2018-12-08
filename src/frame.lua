---@class Frame Кадр
local Frame = {}
Frame.__index = Frame

---@param image Image
---@return Frame
function Frame.init(self, image)
    local obj = {}
    obj._image = image
    return setmetatable(obj, Frame)
end

---@param x number
---@param y number
function Frame.draw(self, x, y)
    local r = 0
    love.graphics.draw(self._image, self.sprite.q, x, y, r)
end
