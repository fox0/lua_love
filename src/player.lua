---@type Sprite
local Sprite = require('src/sprite')

local Player = {}
Player.__index = Player

---@param image Image
---@param world World
---@param x number
---@param y number
---@return Player
function Player:init(image, world, x, y)
    ---@class Player
    local obj = {}
    ---@type SpriteList
    local sprites = Sprite.parse_texture(image)
    obj.SPRITES_GROUND = { sprites.left_run, sprites.left_walk,
                           sprites.left_wait, --todo
                           sprites.right_walk, sprites.right_run }
    assert(#obj.SPRITES_GROUND == 5)
    obj.SPRITES_FLY = { sprites.left_fly_run, sprites.left_fly,
                        sprites.right_fly_wait, --todo отдельный флаг для выбора стороны?
                        sprites.right_fly, sprites.right_fly_run }
    assert(#obj.SPRITES_FLY == 5)

    ---@type Sprite
    obj.sprite = sprites.right_fly
    assert(obj.sprite)

    ---@type Body
    obj.body = love.physics.newBody(world, x, y, 'dynamic')

    --todo другая форма love.physics.newPolygonShape
    local W, H = obj.sprite.W, obj.sprite.H
    local dx, dy = 20, 15
    ---@type Shape
    obj.shape = love.physics.newRectangleShape(W / 2, (H + dy) / 2, 70 - dx, 70 - dy)
    local fixture = love.physics.newFixture(obj.body, obj.shape)
    fixture:setUserData(obj)

    local x0, y0, mass, inertia = obj.shape:computeMass(1)
    log.debug('create new pony:', x0, y0, mass, inertia)
    obj.body:setMassData(x0, y0, mass, inertia)
    --obj.body:setMassData(20,25,1,-0.5)
    --obj.body:setWorldCenter(20, 25)

    --todo как-то различать по расам (как минимум is_fly)
    obj.FORCE = const.FORCE_PONY * 1.0
    obj.MAX_HP = 100

    --status
    obj.is_ground = false
    obj.is_up = false
    obj.is_down = false
    obj.is_left = false
    obj.is_right = false
    obj.is_rotate_left = false
    obj.is_rotate_right = false

    obj.hp = 100
    obj.prev_x = x
    obj.prev_y = y
    obj.prev_r = 0
    obj.speedx = 0
    obj.speedy = 0
    obj.speedr = 0
    obj.ix = 0
    obj.iy = 0
    return setmetatable(obj, Player)
end

-- for debugging
function Player:__tostring()
    return 'player'
end

---@param is_ground boolean
function Player:set_is_ground(is_ground)
    self.is_ground = is_ground
    --reset loop animation
    if not is_ground then
        self.sprite.index = 1
    end
end

--- Врезались в стену. Нужно расчитать и применить урон
function Player:boom_to_ground()
    local speed = math.sum_geometry(self.speedx, self.speedy)
    if speed < const.DAMAGE_SAFE_SPEED then
        return
    end
    local damage = math.pow(speed, 2) * const.K_DAMAGE
    self:set_damage(damage)
end

--- Врезались в другого игрока. Нужно расчитать и применить урон
---@param player2 Player
function Player:boom_to_player(player2)
    --todo считать относительную скорость удара. так как скорость нулевая, то и урон сейчас нулевой :(
    local speed = math.sum_geometry(self.speedx, self.speedy)
    if speed < const.DAMAGE_SAFE_SPEED then
        return
    end
    local damage = math.pow(speed, 2) * const.K_DAMAGE
    --применить урон к обоим игрокам
    self:set_damage(damage)
    player2:set_damage(damage)
end

---@param damage number
function Player:set_damage(damage)
    --todo +красную анимацию (сколько кадров?) (и label с числом причинённого урона)
    self.hp = self.hp - damage
    log.debug(string.format('HP -%.2f. Total: %.2f', damage, self.hp))
end

---Прыжок от поверхности
function Player:jump()
    if self.is_ground then
        self.body:applyLinearImpulse(0, -self.FORCE * const.K_PONY_JUMP)
    end
end

---@param dt number
function Player:update(dt)
    local dt100 = dt * 100

    self.ix, self.iy = 0, 0
    if self.is_left then
        self.ix = -self.FORCE
    end
    if self.is_right then
        self.ix = self.FORCE
    end
    if self.is_up then
        self.iy = -self.FORCE * const.K_PONY_FORCE_FLY_Y
    end
    if self.is_down then
        self.iy = self.FORCE * const.K_PONY_FORCE_FLY_Y
    end

    local want_r = 0
    if not (self.ix == 0 and self.iy == 0) then
        self.ix, self.iy = rotate_point(self.ix, self.iy, self.body:getAngle())
        self.body:applyForce(self.ix * dt100, self.iy * dt100)
        want_r = math.atan2(self.iy, self.ix)
        want_r = normalize_angle(want_r)
    end
    if self.is_rotate_left then
        want_r = want_r - const.K_PONY_R
    end
    if self.is_rotate_right then
        want_r = want_r + const.K_PONY_R
    end

    ---@type number
    local x, y, r = self.body:getX(), self.body:getY(), self.body:getAngle()

    if y < const.WORLD_LIMITY then
        self:set_damage(const.DAMAGE_OVERFLY * dt)
    end
    --восстанавливаем красную и жёлтые зоны
    local hp = self.hp / self.MAX_HP
    if (hp < const.HP_KEY_POINTS[2] - 0.05) or
            (const.HP_KEY_POINTS[2] + 0.1 < hp and hp < const.HP_KEY_POINTS[3] - 0.1) then
        local add = const.DAMAGE_NONE * dt
        self.hp = self.hp + add
        --log.debug(string.format('HP +%.3f. Total: %.2f', add, self.hp))
    end

    self.speedx = (x - self.prev_x) * dt100
    self.speedy = (y - self.prev_y) * dt100
    self.speedr = (r - self.prev_r) * dt100
    self.prev_x = x
    self.prev_y = y
    self.prev_r = r

    --- Сила трения
    local k = (self.is_ground and const.K_FORCE_GROUNG) or const.K_FORCE_SKY
    self.body:applyForce(-self.speedx * k, -self.speedy * k)

    --- Забавный полёт
    if not self.is_ground and self.sprite.index == 4 then
        self.body:applyLinearImpulse(0, -self.FORCE * const.K_PONY_FORCE_FLY_DJITTING)
    end

    local error = r - want_r
    local res = error * const.K_PONY_P + self.speedr * const.K_PONY_I --PID
    self.body:applyTorque(-res * dt100 * const.K_PONY_ROTATE)

    self:_update_sprite()
    assert(self.sprite)
    self.sprite.x = x
    self.sprite.y = y
    self.sprite.r = r
    self.sprite:update(dt)
end

--todo const.SPRITE_KEY_POINTS_GROUND
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

function Player:_update_sprite()
    local DELTA, FAST_SPEED
    ---@type Sprite[]
    local sprites
    if self.is_ground then
        DELTA = 1.5
        FAST_SPEED = 6
        sprites = self.SPRITES_GROUND
    else
        DELTA = 4
        FAST_SPEED = 20
        sprites = self.SPRITES_FLY
    end
    local s = math.sum_geometry(self.speedx, self.speedy) * math.sign(self.speedx)
    if s <= -FAST_SPEED - DELTA then
        self.sprite = sprites[1]
        return
    end
    if -FAST_SPEED + DELTA <= s and s <= -3 * DELTA then
        self.sprite = sprites[2]
        return
    end
    --[-0;+0]
    if -DELTA <= s and s <= DELTA then
        self.sprite = sprites[3]
        return
    end
    if 3 * DELTA <= s and s <= FAST_SPEED - DELTA then
        self.sprite = sprites[4]
        return
    end
    if FAST_SPEED + DELTA < s then
        self.sprite = sprites[5]
        return
    end
end

function Player:draw()
    self.sprite:draw()
    self:_draw_hp()
    if is_debug_gui then
        self:debug_draw()
    end
end

--- Нарисовать полоску hp
function Player:_draw_hp()
    if self.hp <= 0 then
        return
    end
    local r, g, b, a = love.graphics.getColor()
    local x, y, W_HALF = self.sprite.x, self.sprite.y, self.sprite.W / 2
    local hp = self.hp / self.MAX_HP
    if hp > const.HP_KEY_POINTS[3] then
        --              80%         100%
        -- |-----------------------2
        -- |           4----------3
        -- 6----------5
        love.graphics.setColor(const.HP_COLOR_GREEN)
        local K = normalize(hp, const.HP_KEY_POINTS[3], const.HP_KEY_POINTS[4])
        local len_bottom = W_HALF + W_HALF * K
        local x2, y2 = rotate_point(len_bottom + const.HP_H_HALF, 0, self.sprite.r)
        local x3, y3 = rotate_point(len_bottom, const.HP_H_HALF, self.sprite.r)
        local x4, y4 = rotate_point(W_HALF, const.HP_H_HALF, self.sprite.r)
        local x5, y5 = rotate_point(W_HALF - const.HP_H_HALF, 2 * const.HP_H_HALF, self.sprite.r)
        local x6, y6 = rotate_point(0, 2 * const.HP_H_HALF, self.sprite.r)
        love.graphics.polygon('fill', x, y, x2 + x, y2 + y, x3 + x, y3 + y, x4 + x, y4 + y, x5 + x, y5 + y, x6 + x, y6 + y)
    else
        --              80%
        -- |-----------2
        -- |          /
        -- 6---------3
        love.graphics.setColor((hp > const.HP_KEY_POINTS[2] and const.HP_COLOR2) or const.HP_COLOR_RED)
        local K = normalize(hp, const.HP_KEY_POINTS[1], const.HP_KEY_POINTS[3])
        local len_bottom = W_HALF * K
        local x2, y2 = rotate_point(len_bottom + 2 * const.HP_H_HALF, 0, self.sprite.r)
        local x3, y3 = rotate_point(len_bottom, 2 * const.HP_H_HALF, self.sprite.r)
        local x6, y6 = rotate_point(0, 2 * const.HP_H_HALF, self.sprite.r)
        love.graphics.polygon('fill', x, y, x2 + x, y2 + y, x3 + x, y3 + y, x6 + x, y6 + y)
    end

    --todo copypaste
    --border
    local K = 1
    local len_bottom = W_HALF + W_HALF * K
    local x2, y2 = rotate_point(len_bottom + const.HP_H_HALF, 0, self.sprite.r)
    local x3, y3 = rotate_point(len_bottom, const.HP_H_HALF, self.sprite.r)
    local x4, y4 = rotate_point(W_HALF, const.HP_H_HALF, self.sprite.r)
    local x5, y5 = rotate_point(W_HALF - const.HP_H_HALF, 2 * const.HP_H_HALF, self.sprite.r)
    local x6, y6 = rotate_point(0, 2 * const.HP_H_HALF, self.sprite.r)
    love.graphics.polygon('line', x, y, x2 + x, y2 + y, x3 + x, y3 + y, x4 + x, y4 + y, x5 + x, y5 + y, x6 + x, y6 + y)

    love.graphics.setColor(r, g, b, a)
end

function Player:debug_draw()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(0.0, 0.0, 1.0, 1.0)

    local x0, y0 = self.body:getWorldCenter()
    --центр масс
    love.graphics.circle('line', x0, y0, 3)

    --vector force
    local k = 0.05
    love.graphics.line(x0, y0, x0 + self.ix * k, y0 + self.iy * k)

    --vector speed
    love.graphics.setColor(1.0, 0.0, 0.0, 1.0)
    k = 3.0
    love.graphics.line(x0, y0, x0 + self.speedx * k, y0 + self.speedy * k)

    love.graphics.setColor(r, g, b, a)
end

return Player
