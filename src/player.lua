---@type Sprite
local Sprite = require('src/sprite')

---@class Player
---@field public sprite Sprite
---@field sprites table Словарь со спрайтами
---@field body any
---@field shape any
---@field HALF_W number Половина ширины спрайта
---@field HALF_H number
---@field ix number Приложенный импульс
---@field iy number
local Player = {}
Player.__index = Player

--todo x and y
Player.SPEED = 400

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
    obj.sprite = obj.sprites._sprite2_3
    -- чтобы далеко не лазить
    obj.HALF_W = obj.sprite.current_frame.HALF_W
    obj.HALF_H = obj.sprite.current_frame.HALF_H

    obj.body = love.physics.newBody(world, x, y, 'dynamic')
    --obj.body:setMassData(.2)  -- kg

    --todo другая форма love.physics.newPolygonShape
    obj.shape = love.physics.newRectangleShape(obj.HALF_W, obj.HALF_W, 70, 70)
    local fixture = love.physics.newFixture(obj.body, obj.shape)
    fixture:setUserData('player')

    ----
    obj.body:setMassData(obj.shape:computeMass(1))

    --todo в принципе не нужно, но только для нужд отладки
    obj.ix = 0
    obj.iy = 0
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
    self.ix = 0
    self.iy = 0
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        self.ix = -self.SPEED
    end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        self.ix = self.SPEED
    end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        self.iy = -self.SPEED
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        self.iy = self.SPEED
    end
    if not (self.ix == 0 and self.iy == 0) then
        self.ix = self.ix * dt
        self.iy = self.iy * dt
        --log.debug(self.ix, self.iy)
        --self.body:applyLinearImpulse(self.ix, self.iy)
        self.body:applyLinearImpulse(self.ix, self.iy, 0, 50)
    end

    --todo +ии для выровнять угол

    self.sprite.x = self.body:getX()
    self.sprite.y = self.body:getY()
    self.sprite.r = self.body:getAngle()
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

        local x0, y0 = self.body:getWorldCenter()
        love.graphics.circle('line', x0, y0, 3)

        -- центр верхнего левого угла
        local x0 = self.sprite.x
        local y0 = self.sprite.y
        local r0 = self.sprite.r
        log.debug('r =', self.sprite.r)
        --todo поправка на поворот

        -- форма
        local x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8 = self.shape:getPoints()
        local ls = { x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8 }
        for i = 1, #ls / 2 do
            local i2 = i * 2
            local i1 = i2 - 1
            ls[i1] = ls[i1] + x0--+  math.cos(r0)*92
            ls[i2] = ls[i2] + y0
        end
        love.graphics.polygon('line', ls)

        -- вектор силы
        x0 = x0 + self.HALF_W
        y0 = y0 + self.HALF_W
        local K = 5.5
        local x22 = x0 + self.ix * K
        local y22 = y0 + self.iy * K
        love.graphics.line(x0, y0, x22, y22)

        love.graphics.setColor(r, g, b, a)
    end
end

return Player
