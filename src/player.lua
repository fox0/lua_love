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
    ---@type SpriteList
    obj.sprites = Sprite.parse_texture(image)
    obj.SPRITES_GROUND = { obj.sprites.left_run, obj.sprites.left_walk,
                           obj.sprites.left_walk, --todo
                           obj.sprites.right_walk, obj.sprites.right_run }
    assert(#obj.SPRITES_GROUND == 5)
    obj.SPRITES_FLY = { obj.sprites.left_fly_run, obj.sprites.left_fly,
                        obj.sprites.right_fly_wait, --todo отдельный флаг для выбора стороны?
                        obj.sprites.right_fly, obj.sprites.right_fly_run }
    assert(#obj.SPRITES_FLY == 5)

    ---@type Sprite
    obj.sprite = obj.sprites.right_fly
    assert(obj.sprite)

    ---@type Body
    obj.body = love.physics.newBody(world, x, y, 'dynamic')
    --obj.body:setMassData(.2)  -- kg

    --todo другая форма love.physics.newPolygonShape
    local HALF_W, HALF_H = obj.sprite.current_frame.HALF_W, obj.sprite.current_frame.HALF_H
    local dx, dy = 20, 15
    ---@type Shape
    obj.shape = love.physics.newRectangleShape(HALF_W, HALF_H + (dy / 2), 70 - dx, 70 - dy)
    local fixture = love.physics.newFixture(obj.body, obj.shape)
    fixture:setUserData('player')

    obj.body:setMassData(obj.shape:computeMass(1))
    --obj.body:setWorldCenter(20, 25)

    --todo как-то различать по расам (как минимум is_fly)
    obj.FORCE = const.FORCE_PONY * 1.0
    obj.MAX_HP = 100

    obj.hp = 100
    obj.is_ground = false
    obj.prev_x = x
    obj.prev_y = y
    obj.prev_r = 0
    obj.speedx = 0
    obj.speedy = 0
    obj.speedr = 0
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
    self.speedx = (x - self.prev_x) * dt100
    self.speedy = (y - self.prev_y) * dt100
    self.speedr = (r - self.prev_r) * dt100
    self.prev_x = x
    self.prev_y = y
    self.prev_r = r
    self:_update_external_forces()
    self:_update_stable_rotate(dt100, r)
    self:_update_sprite()
    assert(self.sprite)
    self:_update_external_forces3()
    self.sprite.x = x
    self.sprite.y = y
    self.sprite.r = r
    self.sprite:update(dt)
end

---@param self Player
---@param dt100 number
function Player._update_position(self, dt100)
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
        local r = math.atan(iy, ix) * dt100 * const.K_PONY_ROTATE
        if ix < 0 then
            --todo
            r = -r
        end
        self.body:applyTorque(r)
    end
    if self.is_ground and love.keyboard.isDown('space') then
        self.body:applyLinearImpulse(0, -self.FORCE * const.K_PONY_JUMP)
    end
end

--- Сила трения
---@param self Player
function Player._update_external_forces(self)
    local k
    if self.is_ground then
        k = const.K_FORCE_GROUNG
    else
        k = const.K_FORCE_SKY
    end
    self.body:applyForce(-self.speedx * k, -self.speedy * k)
end

--- Стабилизация вращения
---@param self Player
---@param dt100 number
---@param r number
function Player._update_stable_rotate(self, dt100, r)
    local r2 = r % math.pi--todo
    if r2 < .01 or (math.pi - r2) < .01 then
        return
    end
    --восстанавливаем знак
    if r < 0 then
        r2 = -r2
    end
    --self._prev_r = r2 --todo

    --todo делать поворот по меньшей дуге
    local error = r2 - 0
    local res = error * const.K_PONY_P + self.speedr * const.K_PONY_I --PID
    --log.debug('r =', r2, 'res =', res)
    self.body:applyTorque(-res * dt100 * const.K_PONY_ROTATE2)
end

--DELTA = 4
--FAST_SPEED = 20
--LS_GROUND = {
--    -FAST_SPEED - DELTA,
--    -FAST_SPEED + DELTA,
--    -3 * DELTA,
--    -DELTA,
--    DELTA,
--    3 * DELTA,
--    FAST_SPEED - DELTA,
--    FAST_SPEED + DELTA,
--}
--for _, v in ipairs(LS_GROUND) do
--   print(v)
--end

---@param self Player
function Player._update_sprite(self)
    local DELTA, FAST_SPEED, sprites
    if self.is_ground then
        DELTA = 1.5
        FAST_SPEED = 6
        sprites = self.SPRITES_GROUND
    else
        DELTA = 4
        FAST_SPEED = 20
        sprites = self.SPRITES_FLY
    end
    local s = self.speedx
    if s <= -FAST_SPEED - DELTA then
        self.sprite = sprites[1]
        return
    end
    if -FAST_SPEED + DELTA <= s and s <= -3 * DELTA then
        self.sprite = sprites[2]
        return
    end
    if -DELTA <= s and s <= DELTA then
        self.sprite = sprites[3]
        return
    end
    if 3 * DELTA <= s and s <= FAST_SPEED - DELTA then
        self.sprite = sprites[4]
        return
    end
    if FAST_SPEED + DELTA < s then
        --todo ускорять анимацию?
        self.sprite = sprites[5]
        return
    end
end

--- Забавный полёт
---@param self Player
function Player._update_external_forces3(self)
    if not self.is_ground and self.sprite.index == 4 then
        self.body:applyLinearImpulse(0, -self.FORCE * const.K_PONY_FLY)
    end
end

---@param self Player
function Player.draw(self)
    self.sprite:draw()
    self:_draw_hp()
    self:debug_draw()
end

--- Нарисовать полоску hp
---@param self Player
function Player._draw_hp(self)
    local r_, g, b, a = love.graphics.getColor()

    local W, H = self.sprite.W, 4
    local x, y = self.sprite.x, self.sprite.y

    local hp = self.MAX_HP / self.hp
    if hp >= 0.8 then
        --              80%         100%
        -- |-----------------------2
        -- |           4----------3
        -- 6----------5
        --todo длина полоски
        love.graphics.setColor(0.0, 0.47, 0.0, 1.0)
        local x2, y2 = rotate_point(W, 0, self.sprite.r)
        local x3, y3 = rotate_point(W - H, H, self.sprite.r)
        local x4, y4 = rotate_point(W / 2, H, self.sprite.r)
        local x5, y5 = rotate_point(W / 2 - H, 2 * H, self.sprite.r)
        local x6, y6 = rotate_point(0, 2 * H, self.sprite.r)
        love.graphics.polygon('fill', x, y, x2 + x, y2 + y, x3 + x, y3 + y, x4 + x, y4 + y, x5 + x, y5 + y, x6 + x, y6 + y)
    elseif hp >= 0.25 then
        --todo
        -- |------------2
        -- |           /
        -- 4----------3
    else
        --todo
    end

    love.graphics.setColor(r_, g, b, a)
end

function Player.debug_draw()

end

if log.level == 'debug' then
    ---@param self Player
    function Player.debug_draw(self)
        local r, g, b, a = love.graphics.getColor()
        love.graphics.setColor(0.0, 0.0, 1.0, 1.0)
        local x0, y0 = self.body:getWorldCenter()  -- центр масс
        love.graphics.circle('line', x0, y0, 3)
        love.graphics.setColor(r, g, b, a)
    end
end

return Player
