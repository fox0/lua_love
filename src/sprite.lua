local Sprite = {}
Sprite.__index = Sprite

--- Спрайт
-- Публичные аттрибуты класса:
-- * speed (float)
-- * is_animated (bool)
-- * timer (float)
-- * q (Quad)
-- @param frames список Quad
-- @param delay длительность кадра
-- @param speed множитель скорости анимации
Sprite.init = function(self, frames, delay, speed)
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

Sprite.update = function(self, dt)
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

Sprite.set_frame = function(self, index)
    self._index = index
    self.q = self._frames[self._index]
end

return Sprite
