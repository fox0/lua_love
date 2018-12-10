---@type Sprite
local Sprite = require('src/sprite')

local Player = {}
Player.__index = Player

---@param self Player
---@param image Image
---@param world World
---@param x number
---@param y number
---@return Player
function Player.init(self, image, world, x, y)
    ---@class Player
    local obj = {}

    --todo x and y
    obj.SPEED = 200 * 1000
    obj.IMPULSE_JUMP = 300
    obj.IMPULSE_FLY = 50
    obj.FORCE_GROUNG = 40 * 1000
    obj.FORCE_SKY = 1000

    obj._prev_x = x
    obj._prev_y = y
    obj._prev_r = 0

    --todo как-то различать по расам (как минимум is_fly)
    ---@type SpriteList
    obj.sprites = Sprite.parse_texture(image)
    ---@type Sprite
    obj.sprite = obj.sprites._sprite6_3
    -- чтобы далеко не лазить
    obj.HALF_W = obj.sprite.current_frame.HALF_W
    obj.HALF_H = obj.sprite.current_frame.HALF_H

    ---@type Body
    obj.body = love.physics.newBody(world, x, y, 'dynamic')
    --obj.body:setMassData(.2)  -- kg

    --todo другая форма love.physics.newPolygonShape
    local dx = 20
    local dy = 15
    ---@type Shape
    obj.shape = love.physics.newRectangleShape(obj.HALF_W, obj.HALF_H + (dy / 2), 70 - dx, 70 - dy)
    local fixture = love.physics.newFixture(obj.body, obj.shape)
    fixture:setUserData('player')

    obj.body:setMassData(obj.shape:computeMass(1))
    --obj.body:setWorldCenter(20, 25)

    -- статус игрока
    obj.is_ground = false
    return setmetatable(obj, Player)
end

---@param self Player
---@param is_ground boolean
function Player.set_is_ground(self, is_ground)
    self.is_ground = is_ground
    if is_ground then
        --todo
        self.sprite = self.sprites.walk_right
    else
        self.sprite = self.sprites._sprite6_3
        self.sprite.index = 1
    end
    assert(self.sprite)
end

---@param self Player
---@param dt number
function Player.update(self, dt)
    self:_update_position(dt)  --1
    ---@type number
    local x, y, r = self.body:getX(), self.body:getY(), self.body:getAngle()
    self:_update_external_forces(dt, x, y, r)
    self:_update_sprite()
    self._prev_x = x
    self._prev_y = y
    self._prev_r = r
    self.sprite.x = x
    self.sprite.y = y
    self.sprite.r = r
    self.sprite:update(dt)
end

---@param self Player
---@param dt number
function Player._update_position(self, dt)
    local ix = 0
    local iy = 0
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        ix = -self.SPEED
    end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        ix = self.SPEED
    end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        iy = -self.SPEED
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        iy = self.SPEED
    end
    if not (ix == 0 and iy == 0) then
        self.body:applyForce(ix * dt, iy * dt)
        self.body:applyTorque(math.atan(ix, iy) * 1000)
    end
    if self.is_ground and love.keyboard.isDown('space') then
        self.body:applyLinearImpulse(0, -self.IMPULSE_JUMP)
    end
end

---@param self Player
---@param dt number
---@param x number
---@param y number
---@param r number
function Player._update_external_forces(self, dt, x, y, r)
    local speedx = self._prev_x - x
    local speedy = self._prev_y - y
    local speedr = self._prev_r - r

    local k
    if self.is_ground then
        k = self.FORCE_GROUNG
    else
        k = self.FORCE_SKY
    end
    --сила трения
    self.body:applyForce(speedx * k * dt, speedy * k * dt)

    --todo если перевернуться на 180 или больше 360, то делает столько же число оборотов назад. Фича?
    local P = 1500
    local I = 100000
    local error = 0 - r
    self.body:applyTorque(error * P + speedr * I)  -- PID
end

---@param self Player
function Player._update_sprite(self)
    if not self.is_ground then
        if self.sprite.index == 4 then
            --забавный полёт
            self.body:applyLinearImpulse(0, -self.IMPULSE_FLY)
        end
    end
end

---@param self Player
function Player.draw(self)
    self.sprite:draw()
    self:debug_draw()
end

function Player.debug_draw()

end

if log.level == 'debug' then
    ---@param self Player
    function Player.debug_draw(self)
        local r, g, b, a = love.graphics.getColor()
        love.graphics.setColor(.0, .0, 1., 1.)
        local x0, y0 = self.body:getWorldCenter()  -- центр масс
        love.graphics.circle('line', x0, y0, 3)
        love.graphics.setColor(r, g, b, a)
    end
end

return Player
