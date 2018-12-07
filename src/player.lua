local Sprite = require('src/sprite')

local Player = {}
Player.__index = Player

Player.SPEED = 400

Player.init = function(self, name, x, y)
    log.debug('create', name)
    local obj = {}
    setmetatable(obj, Player)
    obj.image = love.graphics.newImage(string.format('sprites/%s.png', name))
    obj:_load_sprites()
    obj.x = x
    obj.y = y
    return obj
end

Player._load_sprites = function(self)
    self._sprite1 = Sprite:init(self:_get_frames(0, 0, 4))
    self._sprite2 = Sprite:init(self:_get_frames(0, 5, 9))
    self._sprite_sleep = Sprite:init(self:_get_frames(0, 10, 12))


    --todo mirror?

    --self._sprite_fly_right = Sprite:init(FRAMES, 3)

    --todo
    self.sprite = self._sprite_sleep
end

Player._get_frames = function(self, y, x, x2)
    local result = {}
    local S = 96  --+бордеры по пикселю
    local B = 0  --todo
    for i = x, x2 do
        result[#result + 1] = love.graphics.newQuad((i * S) + B, B, S - B, S - B, self.image:getDimensions())
    end
    return result
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
    love.graphics.draw(self.image, self.sprite.q, self.x, self.y)
end

return Player
