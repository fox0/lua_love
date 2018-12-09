---@type Sprite
local Sprite = require('src/sprite')

---@class Player
---@field public is_ground boolean
---@field public sprite Sprite
---@field sprites table Словарь со спрайтами
---@field body any
---@field shape any
---@field HALF_W number Половина ширины спрайта
---@field HALF_H number
---@field _prev_r number
local Player = {}
Player.__index = Player

--todo x and y
Player.SPEED = 200 * 1000
Player.SPEED_JUMP = 1000

---@param self Player
---@param image Image
---@param world any
---@param x number
---@param y number
---@return Player
function Player.init(self, image, world, x, y)
    local obj = {}
    --todo как-то различать по расам (как минимум is_fly)
    obj.sprites = Sprite.parse_texture(image)
    ---@type Sprite
    --obj.sprite = obj.sprites._sprite2_3
    obj.sprite = obj.sprites._sprite6_3
    -- чтобы далеко не лазить
    obj.HALF_W = obj.sprite.current_frame.HALF_W
    obj.HALF_H = obj.sprite.current_frame.HALF_H

    obj.body = love.physics.newBody(world, x, y, 'dynamic')
    --obj.body:setMassData(.2)  -- kg

    --todo другая форма love.physics.newPolygonShape
    obj.shape = love.physics.newRectangleShape(obj.HALF_W, obj.HALF_H, 70, 70)
    local fixture = love.physics.newFixture(obj.body, obj.shape)
    fixture:setUserData('player')

    obj.body:setMassData(obj.shape:computeMass(1))
    --obj.body:setWorldCenter(20, 25)

    -- статус игрока
    obj.is_ground = false

    obj._prev_r = 0
    return setmetatable(obj, Player)
end

--if log.level == 'debug' then
--    ---@param self Player
--    ---@return string
--    function Player.__tostring(self)
--        return string.format('<Player> x=%d y=%d name="%s"', self.x, self.y, self.name)
--    end
--end

---@param self Player
---@param dt number
function Player.update(self, dt)
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
    end

    if self.is_ground and love.keyboard.isDown('space') then
        self.body:applyLinearImpulse(0, -self.SPEED_JUMP)
    end

    --todo если перевернуться на 180 или больше 360, то делает столько же число оборотов. Фича?
    --PID
    local r = self.body:getAngle()
    local P = 2000
    local I = 100000
    local error = 0 - r
    local error2 = self._prev_r - r
    self.body:applyTorque(error * P + error2 * I)
    self._prev_r = r

    self.sprite.x = self.body:getX()
    self.sprite.y = self.body:getY()
    self.sprite.r = r
    self.sprite:update(dt)
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
