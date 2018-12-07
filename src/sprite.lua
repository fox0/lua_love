local Sprite = {}
Sprite.__index = Sprite

--[[
delay - длительность кадра
]]--
Sprite.init = function(self, frames, delay)
    local obj = {}
    obj._frames = frames
    obj._delay = delay or .15  --0.07
    obj._timer = 0
    obj._index_frame = 1  -- нумерация с единицы
    obj.q = frames[obj._index_frame]
    return setmetatable(obj, Sprite)
end

Sprite.update = function(self, dt)
    self._timer = self._timer + dt
    if self._timer > self._delay then
        self._timer = self._timer - self._delay
        self._index_frame = self._index_frame + 1
        if self._index_frame > #self._frames then
            self._index_frame = 1
        end
        self.q = self._frames[self._index_frame]
    end
end

return Sprite
