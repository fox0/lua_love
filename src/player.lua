local SPEED = 400
local IMG = love.graphics.newImage('img/love-ball.png')

local Player = {}
Player.__index = Player

Player.init = function(self, x, y)
    -- self == Player
    local obj = {}
    setmetatable(obj, Player)
    obj.image = IMG
    obj.x = x
    obj.y = y
    return obj
end

Player.update = function(self, dt)
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

Player.draw = function(self)
    love.graphics.draw(self.image, self.x, self.y)
end

return Player
