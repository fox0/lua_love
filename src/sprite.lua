local Sprite = {}
Sprite.__index = Sprite

Sprite.init = function(self, frames, delay)
    --[[
    frames - список Quad
    delay - длительность кадра
    ]]--
    local obj = {}
    obj._frames = frames
    obj._delay = delay or .15  --0.07
    obj.timer = 0
    obj.speed = 1.
    obj.index_frame = 1  -- нумерация с единицы
    obj.q = frames[obj.index_frame]
    return setmetatable(obj, Sprite)
end

Sprite.update = function(self, dt)
    self.timer = self.timer + dt * self.speed
    if self.timer > self._delay then
        self.timer = self.timer - self._delay
        self.index_frame = self.index_frame + 1
        if self.index_frame > #self._frames then
            self.index_frame = 1
        end
        self.q = self._frames[self.index_frame]
    end
end

return Sprite
