---@class Sprite Спрайт
---@field public speed number множитель скорости анимации
---@field public is_animated boolean
---@field public timer number
---@field public q any
---@field _frames any
---@field _index number
---@field _delay number
local Sprite = {}
Sprite.__index = Sprite

---@param frames table список Quad
---@param delay number длительность кадра
---@param speed number множитель скорости анимации
---@return Sprite
function Sprite.init(self, frames, delay, speed)
    local obj = {}
    obj._frames = frames
    obj._index = 1  -- нумерация с единицы
    obj._delay = delay or .15  --0.07
    obj.speed = speed or 1.
    obj.is_animated = true
    obj.timer = 0
    obj.q = obj._frames[obj._index]
    return setmetatable(obj, Sprite)
end

---@param dt number
function Sprite.update(self, dt)
    if not self.is_animated then
        return
    end
    self.timer = self.timer + dt * self.speed
    if self.timer > self._delay then
        self.timer = self.timer - self._delay
        self._index = self._index + 1
        if self._index > #self._frames then
            self._index = 1
        end
        self.q = self._frames[self._index]
    end
end

---@param index number
function Sprite.set_frame(self, index)
    self._index = index
    self.q = self._frames[self._index]
end

return Sprite
