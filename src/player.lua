local SPEED = 400

-- todo вынести анимацию в отдельный класс
--https://github.com/fox0/LOVE-Example-Browser/blob/master/animation.lua

local FRAMES = {}
for i = 12, 17 do
    -- todo bug
    FRAMES[#FRAMES] = love.graphics.newImage('img/6_' .. i .. '.png')
end

local Player = {}
Player.__index = Player

Player.init = function(self, x, y)
    local obj = {}
    obj.x = x
    obj.y = y
    obj._timer = 0
    obj._index_frame = 1
    return setmetatable(obj, Player)
end

Player.update = function(self, dt)
    self:_update_coord(dt)
    self:_update_animation(dt)
end

Player._update_coord = function(self, dt)
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        self.x = self.x - SPEED * dt
    end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        self.x = self.x + SPEED * dt
    end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        self.y = self.y - SPEED * dt
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        self.y = self.y + SPEED * dt
    end
end

Player._update_animation = function(self, dt)
    self._timer = self._timer + dt * 400
    log.debug(self._timer)
    if self._timer > 40 then
        self._timer = self._timer - 40
        self._index_frame = self._index_frame + 1
        if self._index_frame > #FRAMES then
            self._index_frame = 0
        end
    end
end

Player.draw = function(self)
    -- todo хранить ссылку на спрайт
    log.debug(self._index_frame) -- todo bug
    love.graphics.draw(FRAMES[self._index_frame], self.x, self.y)
end

return Player
