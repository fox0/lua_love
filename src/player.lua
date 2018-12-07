local Sprite = require('src/sprite')

local Player = {}
Player.__index = Player
Player.SPEED = 400

-- нумерация с единицы
local FRAMES = {}
for i = 12, 17 do
    FRAMES[#FRAMES + 1] = love.graphics.newImage('img/6_' .. i .. '.png')
end
Player._sprite_fly_right = Sprite:init(FRAMES)
FRAMES = nil

Player.init = function(self, x, y)
    local obj = {}
    obj.x = x
    obj.y = y
    --todo
    obj.sprite = self._sprite_fly_right
    return setmetatable(obj, Player)
end

Player.update = function(self, dt)
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        self.x = self.x - dt * self.SPEED
    end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        self.x = self.x + dt * self.SPEED
    end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        self.y = self.y - dt * self.SPEED
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        self.y = self.y + dt * self.SPEED
    end
    self.sprite:update(dt)
end

Player.draw = function(self)
    love.graphics.draw(self.sprite.image, self.x, self.y)
end

return Player
