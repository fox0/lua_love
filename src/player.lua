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
    obj.SPRITES_GROUND = { sprites.wait, sprites.walk, sprites.run }
    obj.SPRITES_FLY = { sprites.fly_wait, sprites.fly, sprites.fly_run }
    assert(#obj.SPRITES_GROUND == 3)
    assert(#obj.SPRITES_FLY == 3)

    ---@type Sprite
    obj.sprite = obj.SPRITES_FLY[1]

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
    obj.is_mirror = false

    --public field
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

    obj.filter_r = math.get_median_smooth(21)
    obj.filter_s = math.get_median_smooth(41)
    obj.r0 = 0
    obj.speed = 0

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
    --if not is_ground then
    --    self.sprite.index = 1
    --end
end

--- Врезались в неподвижную стену. Нужно расчитать и применить урон
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
    self.hp = self.hp - damage
    --log.debug(string.format('HP -%.2f. Total: %.2f', damage, self.hp))
end

---Прыжок от поверхности
function Player:jump()
    if self.is_ground then
        self.body:applyLinearImpulse(0, -self.FORCE * const.K_PONY_JUMP)
    end
end

--- Здесь ИИ ботов
---@param player Player
function Player:update_bots_ai(player)
    --блин, получилось слишком сложное управление поняшей.
    if self.is_ground then
        self:jump()
    end
    if self.prev_x + 100 > player.prev_x then
        self.is_left = true
    end
    if self.prev_x + 100 < player.prev_x then
        self.is_right = true
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
        local t = math.rotate_point(0, 0, self.body:getAngle(), { self.ix, self.iy })
        self.ix, self.iy = t[1], t[2]
        self.body:applyForce(self.ix * dt100, self.iy * dt100)
        want_r = math.atan2(self.iy, self.ix)
        want_r = math.normalize_angle(want_r)
    end
    if (self.is_rotate_left and not self.is_mirror) or (self.is_rotate_right and self.is_mirror) then
        want_r = want_r - const.K_PONY_R
    end
    if (self.is_rotate_right and not self.is_mirror) or (self.is_rotate_left and self.is_mirror) then
        want_r = want_r + const.K_PONY_R
    end

    ---@type number
    local x, y, r = self.body:getX(), self.body:getY(), self.body:getAngle()

    self.speedx = (x - self.prev_x) * dt100
    self.speedy = (y - self.prev_y) * dt100
    self.speedr = (r - self.prev_r) * dt100
    self.prev_x = x
    self.prev_y = y
    self.prev_r = r
    self.is_mirror = self.speedx < 0

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

    self:_update_hp(dt)
    self.sprite = self:_update_sprite() or self.sprite
    self.sprite.x = x
    self.sprite.y = y
    self.sprite.r = r
    self.sprite.is_mirror = self.is_mirror
    self.sprite:update(dt)

    self.r0 = self.filter_r(math.atan2(self.speedy, self.speedx))
    self.speed = self.filter_s(math.sum_geometry(self.speedy, self.speedx))
end

---@param dt number
function Player:_update_hp(dt)
    if self.body:getY() < const.WORLD_LIMITY then
        self:set_damage(const.DAMAGE_OVERFLY * dt)
    end
    --восстанавливаем красную и жёлтые зоны
    local hp = self.hp / self.MAX_HP
    if (hp < const.UI_HP_KEY_POINTS[2] - 0.05) or
            (const.UI_HP_KEY_POINTS[2] + 0.1 < hp and hp < const.UI_HP_KEY_POINTS[3] - 0.1) then
        local add = const.DAMAGE_NONE * dt
        self:set_damage(-add)
        --log.debug(string.format('HP +%.3f. Total: %.2f', add, self.hp))
    end
end

---@return Sprite|nil
function Player:_update_sprite()
    local DELTA, FAST_SPEED
    ---@type Sprite[]
    local sprites
    if self.is_ground then
        DELTA = 1.5
        FAST_SPEED = 6
        sprites = self.SPRITES_GROUND
        --todo const.SPRITE_KEY_POINTS_GROUND
    else
        DELTA = 4
        FAST_SPEED = 20
        sprites = self.SPRITES_FLY
    end
    local s = math.sum_geometry(self.speedx, self.speedy)
    --[-0;+0]
    if s <= DELTA then
        return sprites[1]
    end
    if 3 * DELTA <= s and s <= FAST_SPEED - DELTA then
        return sprites[2]
    end
    if FAST_SPEED + DELTA < s then
        return sprites[3]
    end
end

function Player:draw()
    self.sprite:draw()
    local r, g, b, a = love.graphics.getColor()
    self:_draw_hp()
    self:_draw_force()
    self:_draw_speed()
    love.graphics.setColor(r, g, b, a)
    if is_debug_gui then
        self:debug_draw()
    end
end

--- Нарисовать полоску hp
function Player:_draw_hp()
    if self.hp <= 0 then
        return
    end
    local x, y, W_HALF = self.sprite.x, self.sprite.y, self.sprite.W / 2
    local hp = self.hp / self.MAX_HP
    if hp > const.UI_HP_KEY_POINTS[3] then
        --              80%         100%
        -- |-----------------------2
        -- |           4----------3
        -- 6----------5
        love.graphics.setColor(const.UI_HP_COLOR_GREEN)
        local K = math.normalize(hp, const.UI_HP_KEY_POINTS[3], const.UI_HP_KEY_POINTS[4])
        local len_bottom = W_HALF + W_HALF * K
        love.graphics.polygon('fill', math.rotate_point(x, y, self.sprite.r, {
            0, 0,
            len_bottom + const.UI_HP_H_HALF, 0,
            len_bottom, const.UI_HP_H_HALF,
            W_HALF, const.UI_HP_H_HALF,
            W_HALF - const.UI_HP_H_HALF, 2 * const.UI_HP_H_HALF,
            0, 2 * const.UI_HP_H_HALF
        }))
    else
        --              80%
        -- |-----------2
        -- |          /
        -- 6---------3
        love.graphics.setColor((hp > const.UI_HP_KEY_POINTS[2] and const.UI_HP_COLOR2) or const.UI_HP_COLOR_RED)
        local K = math.normalize(hp, const.UI_HP_KEY_POINTS[1], const.UI_HP_KEY_POINTS[3])
        local len_bottom = W_HALF * K
        love.graphics.polygon('fill', math.rotate_point(x, y, self.sprite.r, {
            0, 0,
            len_bottom + 2 * const.UI_HP_H_HALF, 0,
            len_bottom, 2 * const.UI_HP_H_HALF,
            0, 2 * const.UI_HP_H_HALF
        }))
    end

    --border
    local len_bottom = W_HALF * 2
    love.graphics.polygon('line', math.rotate_point(x, y, self.sprite.r, {
        0, 0,
        len_bottom + const.UI_HP_H_HALF, 0,
        len_bottom, const.UI_HP_H_HALF,
        W_HALF, const.UI_HP_H_HALF,
        W_HALF - const.UI_HP_H_HALF, 2 * const.UI_HP_H_HALF,
        0, 2 * const.UI_HP_H_HALF
    }))
end

--- vector force
function Player:_draw_force()
    if self.ix == 0 and self.iy == 0 then
        return
    end
    local x0, y0 = self.body:getWorldCenter()
    local r0 = math.atan2(self.iy, self.ix)
    love.graphics.setColor(const.UI_FORCE_COLOR)
    love.graphics.polygon('line', math.rotate_point(x0, y0, r0, {
        const.UI_FORCE_X0 + 0, -const.UI_FORCE_SIZE,
        const.UI_FORCE_X0 + 2 * const.UI_FORCE_SIZE, 0,
        const.UI_FORCE_X0 + 0, const.UI_FORCE_SIZE,
        const.UI_FORCE_X0 + const.UI_FORCE_SIZE, 0
    }))
end

--- vector speed
function Player:_draw_speed()
    local x0, y0 = self.body:getWorldCenter()
    local x_shift = const.UI_SPEED_X0
    love.graphics.setColor(const.UI_SPEED_COLOR)
    for _ = 1, math.round(self.speed * const.UI_SPEED_K) do
        love.graphics.polygon('line', math.rotate_point(x0, y0, self.r0, {
            x_shift + 0, -const.UI_SPEED_SIZE,
            x_shift + 2 * const.UI_SPEED_SIZE, 0,
            x_shift + 0, const.UI_SPEED_SIZE,
            x_shift + const.UI_SPEED_SIZE, 0
        }))
        x_shift = x_shift + const.UI_SPEED_STEP
    end
end

function Player:debug_draw()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(0.0, 0.0, 1.0, 1.0)
    local x0, y0 = self.body:getWorldCenter() --центр масс
    love.graphics.circle('line', x0, y0, 3)
    love.graphics.setColor(r, g, b, a)
end

return Player
