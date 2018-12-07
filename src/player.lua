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
    self._sprite1_1 = Sprite:init(self:_get_frames(0, 0, 5))
    self._sprite1_2 = Sprite:init(self:_get_frames(0, 5, 5))
    self._sprite_sleep = Sprite:init(self:_get_frames(0, 10, 3))

    self._sprite2_1 = Sprite:init(self:_get_frames(1, 0, 6))
    self._sprite2_2 = Sprite:init(self:_get_frames(1, 6, 6))
    self._sprite_walk = Sprite:init(self:_get_frames(1, 12, 6))
    self._sprite2_4 = Sprite:init(self:_get_frames(1, 18, 6))
    self._sprite2_5 = Sprite:init(self:_get_frames(1, 24, 6))

    --todo mirror?

    --todo
    self.sprite = self._sprite2_5
end

Player._get_frames = function(self, y, x, count)
    local result = {}
    local S = 96
    local B = 2
    for i = x, x + count - 1 do
        result[#result + 1] = love.graphics.newQuad(B + i * S, B + y * S, S - 2 * B, S - 2 * B, self.image:getDimensions())
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
    self:_debug_draw()
end

if log.level == 'debug' then
    Player._debug_draw = function(self)
        love.graphics.setLineStyle('rough')
        love.graphics.setColor(.0, 1., .0, 1.)
        love.graphics.rectangle('line', self.x, self.y, 92, 92) --todo
        love.graphics.setColor(1., 1., 1., 1.)
    end
else
    Player._debug_draw = function(self)
    end
end

return Player
