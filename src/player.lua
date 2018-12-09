---@type Sprite
local Sprite = require('src/sprite')

--setfenv(1, {})

---@class Player
---@field public sprite Sprite
---@field sprites table Словарь со спрайтами
---@field body any
---@field shape any
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

    obj.body = love.physics.newBody(world, x, y, 'dynamic')
    --local _, _, w, h = obj.sprite.current_frame._quad:getViewport()
    --log.debug(w,h)
    local w, h = 92, 92
    obj.shape = love.physics.newCircleShape(w / 2, h / 2, 35)
    local fixture = love.physics.newFixture(obj.body, obj.shape)
    fixture:setUserData('player')
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
        self.body:applyLinearImpulse(self.ix, self.iy)
        --self.body:applyLinearImpulse(self.ix, self.iy, 0, 50)
    end

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

        local x, y = self.shape:getPoint()
        local x1 = self.sprite.x + x
        local y1 = self.sprite.y + y
        --todo self.sprite.r
        love.graphics.circle('line', x1, y1, self.shape:getRadius())

        local K = 5.5
        local x2 = x1 + self.ix * K
        local y2 = y1 + self.iy * K
        love.graphics.line(x1, y1, x2, y2)

        love.graphics.setColor(r, g, b, a)
    end
end

return Player
