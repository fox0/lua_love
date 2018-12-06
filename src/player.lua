local Player = {}
Player.__index = Player

function Player:init(x, y)
    local self = {}
    setmetatable(self, Player)
    self.image = love.graphics.newImage('img/love-ball.png')
    self.x = x
    self.y = y
    return self
end

function Player:update(dt)
    local s = 300
    if love.keyboard.isDown("left") then
        self.x = self.x - s * dt
    end
    if love.keyboard.isDown("right") then
        self.x = self.x + s * dt
    end
    if love.keyboard.isDown("up") then
        self.y = self.y - s * dt
    end
    --log:debug(love.keyboard.isDown("down"))
    if love.keyboard.isDown("down") then
        self.y = self.y + s * dt
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

return Player
