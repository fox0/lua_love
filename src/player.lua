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
    --силушка поняши в лошадиных силах
    obj.FORCE = 1000

    obj.is_ground = false
    obj._prev_x = x
    obj._prev_y = y
    obj._prev_r = 0
    obj.speedx = 0
    obj.speedy = 0
    obj.speedr = 0

    --todo как-то различать по расам (как минимум is_fly)
    ---@type SpriteList
    obj.sprites = Sprite.parse_texture(image)
    ---@type Sprite
    obj.sprite = obj.sprites.right_fly
    assert(obj.sprite)
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
    return setmetatable(obj, Player)
end

---@param self Player
---@param is_ground boolean
function Player.set_is_ground(self, is_ground)
    self.is_ground = is_ground
    if is_ground then
        --todo
        --self.sprite = self.sprites.walk_right
    else
        --self.sprite = self.sprites._sprite6_3
        self.sprite.index = 1
    end
    assert(self.sprite)
end

---@param self Player
---@param dt number
function Player.update(self, dt)
    local dt100 = dt * 100
    self:_update_position(dt100)  --1
    ---@type number
    local x, y, r = self.body:getX(), self.body:getY(), self.body:getAngle()
    self.speedx = (x - self._prev_x) * dt100
    self.speedy = (y - self._prev_y) * dt100
    self.speedr = (r - self._prev_r) * dt100
    self._prev_x = x
    self._prev_y = y
    self._prev_r = r
    self:_update_external_forces()
    self:_update_external_forces2(r)
    self:_update_sprite()
    assert(self.sprite)
    self:_update_external_forces3()
    self.sprite.x = x
    self.sprite.y = y
    self.sprite.r = r
    self.sprite:update(dt)
end

---@param self Player
---@param dt number
function Player._update_position(self, dt100)
    local IMPULSE_JUMP = 300
    local ix, iy = 0, 0
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        ix = -self.FORCE
    end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        ix = self.FORCE
    end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        iy = -self.FORCE
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        iy = self.FORCE
    end
    if not (ix == 0 and iy == 0) then
        self.body:applyForce(ix * dt100, iy * dt100)
        self.body:applyTorque(math.atan(ix, iy) * dt100 * 100)
    end
    if self.is_ground and love.keyboard.isDown('space') then
        self.body:applyLinearImpulse(0, -IMPULSE_JUMP)
    end
end

--- Сила трения
---@param self Player
function Player._update_external_forces(self)
    local k
    if self.is_ground then
        k = const.FORCE_GROUNG
    else
        k = const.FORCE_SKY
    end
    self.body:applyForce(-self.speedx * k, -self.speedy * k)
end

--- Стабилизация вращения
---@param self Player
---@param r number
function Player._update_external_forces2(self, r)
    local r2 = r % math.pi--todo
    if r2 < .01 or (math.pi - r2) < .01 then
        return
    end
    --восстанавливаем знак
    if r < 0 then
        r2 = -r2
    end
    --self._prev_r = r2 --todo

    local P = 1.5
    local I = 100
    --todo делать поворот по меньшей дуге
    local error = r2 - 0
    local res = error * P + self.speedr * I --PID
    res = -res
    log.debug('r =', r2, 'res =', res)
    self.body:applyTorque(res * 1000)
end

--function Player._normalize_angle(angle)
--    local result = angle % (2 * math.pi)
--    return result
--end
--
--if log.level == 'debug' then
--    assert(Player._normalize_angle(-4 * math.pi) == 0)
--    --is_equal(Player._normalize_angle(-3 * math.pi)== 0)
--    assert(Player._normalize_angle(-2 * math.pi) == 0)
--    assert(Player._normalize_angle(-math.pi) == math.pi)
--    assert(Player._normalize_angle(0) == 0)
--    assert(Player._normalize_angle(math.pi / 2) == math.pi / 2)
--    assert(Player._normalize_angle(math.pi) == math.pi)
--    assert(Player._normalize_angle(2 * math.pi) == 0)
--    assert(Player._normalize_angle(3 * math.pi) == math.pi)
--    assert(Player._normalize_angle(4 * math.pi) == 0)
--end

---@param self Player
function Player._update_sprite(self)
    local FAST_SPEED_GROUND = 6

    local s = self.speedx
    if self.is_ground then
        --[-inf;-5]
        if s < -FAST_SPEED_GROUND then
            --todo чуточку подлагивает. сделать дельту
            self.sprite = self.sprites.left_run
            return
        end
        --[-5;0]
        if s < 0 then
            self.sprite = self.sprites.left_walk
            return
        end
        if s == 0 then
            --todo
            return
        end
        --[5;+inf]
        if s > FAST_SPEED_GROUND then
            self.sprite = self.sprites.right_run
            return
        end
        --[0;5]
        self.sprite = self.sprites.right_walk
        return
    end

    --fly
    if s < 0 then
        self.sprite = self.sprites.left_fly
    elseif s == 0 then
        --(-5;5)
        --todo left (отдельный флаг?)
        self.sprite = self.sprites.right_fly_wait
    elseif s > 0 then
        self.sprite = self.sprites.right_fly
    end
end

--- Забавный полёт
---@param self Player
function Player._update_external_forces3(self)
    local IMPULSE_FLY = 50
    if not self.is_ground and self.sprite.index == 4 then
        self.body:applyLinearImpulse(0, -IMPULSE_FLY)
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

        love.graphics.setColor(.0, .0, .0, .7)
        love.graphics.rectangle('fill', 0, 14, 300, 14)
        love.graphics.setColor(.0, 1., .0, 1.)
        local s = string.format('(%d;%d) %d speed: %.2f %.2f %.2f',
                self.body:getX(), self.body:getY(), self.body:getAngle() * (180 / math.pi),
                self.speedx, self.speedy, self.speedr)
        love.graphics.print(s, 0, 14)

        love.graphics.setColor(r, g, b, a)
    end
end

return Player
